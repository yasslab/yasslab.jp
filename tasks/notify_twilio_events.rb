require 'twilio-ruby'
require 'slack/incoming/webhooks'
require 'openai'
require 'net/http'
require 'tempfile'

# 環境変数の確認
tel_numbers    = ENV['TWILIO_TEL_NUMBERS']
account_sid    = ENV['TWILIO_ACCOUNT_SID']
auth_token     = ENV['TWILIO_AUTH_TOKEN']
slack_webhooks = ENV['TWILIO_SLACK_WEBHOOKS']
openai_token   = ENV['OPENAI_ACCESS_TOKEN']  # Optional: Start transcribing if set

# 必須環境変数のチェック
missing_vars = []
missing_vars << "TWILIO_TEL_NUMBERS"    unless tel_numbers
missing_vars << "TWILIO_ACCOUNT_SID"    unless account_sid
missing_vars << "TWILIO_AUTH_TOKEN"     unless auth_token
missing_vars << "TWILIO_SLACK_WEBHOOKS" unless slack_webhooks

if missing_vars.any?
  puts "Error: Missing required environment variables:"
  missing_vars.each { |var| puts "  - #{var}" }
  puts "\nPlease set the above environment variables and try again."
  exit 1
end

# Twilioクライアントの初期化
client = Twilio::REST::Client.new(account_sid, auth_token)

# 過去の録音を取得
time_range = Time.now - 3600   # 本番用：過去1時間
#time_range = Time.now - 86400  # テスト用：過去24時間

puts "Checking for recordings after #{time_range}..."
recordings = client.recordings.list(date_created_after: time_range)

if recordings.empty?
  puts "No new recordings found in the last hour"
  exit 0
end

# 番号とWebhookのマッピングを準備
tel_numbers_array = tel_numbers.split(',').map(&:strip)
slack_webhooks_array = slack_webhooks.split(',').map(&:strip)

# 番号と対応するWebhookのマッピングを作成
number_to_webhook = {}
tel_numbers_array.each_with_index do |number, index|
  # 対応するWebhookがあれば使用、なければ最後のWebhookを使用
  webhook = slack_webhooks_array[index] || slack_webhooks_array.last
  number_to_webhook[number] = webhook
end

recordings.each do |recording|
  # Twilio イベント情報の取得・整理
  call        = client.calls(recording.call_sid).fetch
  duration    = recording.duration
  created_at  = recording.date_created.localtime('+09:00')
  from_number = call.from
  to_number   = call.to
  recording_url = "https://api.twilio.com/2010-04-01/Accounts/#{account_sid}/Recordings/#{recording.sid}.mp3"
  
  # 設定された番号への着信かチェック
  next unless number_to_webhook.has_key?(to_number)
  
  # 対応するSlack Webhookを取得
  slack_webhook = number_to_webhook[to_number]
  slack = Slack::Incoming::Webhooks.new(slack_webhook)
  
  # OpenAIで文字起こし（トークンがある場合のみ）
  transcription = nil
  if openai_token
    begin
      puts "Transcribing recording #{recording.sid}..."
      
      # 録音ファイルをダウンロード
      uri = URI(recording_url)
      request = Net::HTTP::Get.new(uri)
      request.basic_auth(account_sid, auth_token)
      
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end
      
      if response.code == '200'
        # 一時ファイルに保存
        Tempfile.create(['recording', '.mp3']) do |tempfile|
          tempfile.binmode
          tempfile.write(response.body)
          tempfile.rewind
          
          # OpenAI Whisper APIで文字起こし
          openai_client = OpenAI::Client.new(access_token: openai_token)
          result = openai_client.audio.transcribe(
            parameters: {
              model: 'whisper-1',
              file: File.open(tempfile.path),
              language: 'ja'
            }
          )
          
          if result && result['text']
            transcription = result['text']
            
            # Whisperの幻覚キーワードを検出
            hallucination_keywords = [
              'チャンネル登録',
              '視聴',
              'ご覧',
              '動画',
              'subscribe',
              'watching',
              'channel',
              'video'
            ]
            
            # キーワードが含まれている場合は警告を追加（1つでも検出したら警告）
            matched_keywords = hallucination_keywords.select { |keyword| transcription.downcase.include?(keyword.downcase) }
            if matched_keywords.size >= 1
              transcription = "⚠️ 注意: 無音またはBGMのみの可能性があります（検出: #{matched_keywords.join(', ')}）\n\n#{transcription}"
            end
          end
        end
      end
    rescue => e
      puts "Transcription error: #{e.message}"
      transcription = nil
    end
  end

  # Slackメッセージを作成
  message = <<~MSG
    :telephone_receiver: *新しい録音メッセージ*
    
    :phone: 発信元: #{from_number}
    :dart: 発信先: #{to_number}
    :stopwatch: 録音時間: #{duration}秒
    :calendar: 受信日時: #{created_at.strftime('%Y年%m月%d日 %H:%M')}
    :id: 録音ID: #{recording.sid}
  MSG
  
  # 文字起こしがある場合は追加
  if transcription
    message += <<~MSG
    
    :memo: *文字起こし内容:*
    ```
    #{transcription}
    ```
    MSG
  end
  
  message += <<~MSG
    
    録音URL: #{recording_url}
    (認証情報はTwilioコンソールでご確認ください)
  MSG

  # Slackに送信
  slack.post message

  puts "Notified recording #{recording.sid} to Slack"
end

puts "Successfully notified #{recordings.length} recording(s) to Slack"
