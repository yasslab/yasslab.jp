require 'twilio-ruby'
require 'slack/incoming/webhooks'

desc "Notify recent Twilio events to Slack"
task :notify_twilio_events do
  # 環境変数の確認
  account_sid   = ENV['TWILIO_ACCOUNT_SID']
  auth_token    = ENV['TWILIO_AUTH_TOKEN']
  slack_webhook = ENV['TWILIO_SLACK_WEBHOOK']
  
  unless account_sid && auth_token && slack_webhook
    puts "Error: Missing required environment variables"
    puts "Required: TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN, TWILIO_SLACK_WEBHOOK"
    exit 1
  end
  
  # Twilioクライアントの初期化
  client = Twilio::REST::Client.new(account_sid, auth_token)

  # Detect Twilio events
  #one_day_ago = Time.now - 86400 # 過去24時間の録音を取得（テスト用）
  one_hour_ago = Time.now - 3600  # 過去1時間の録音を取得
  puts "Checking for recordings after #{one_hour_ago}..."
  recordings = client.recordings.list(date_created_after: one_hour_ago)
  
  if recordings.empty?
    puts "No new recordings found in the last hour"
    exit 0
  end
  
  # Slack通知の準備
  slack = Slack::Incoming::Webhooks.new(slack_webhook)
  
  recordings.each do |recording|
    # 通話情報を取得
    call = client.calls(recording.call_sid).fetch
    
    # 録音情報の整理
    duration = recording.duration
    created_at = recording.date_created.localtime('+09:00')
    from_number = call.from
    to_number = call.to
    recording_url = "https://api.twilio.com/2010-04-01/Accounts/#{account_sid}/Recordings/#{recording.sid}.mp3"
    
    # Slackメッセージの作成
    attachments = [{
      fallback: "新しい録音メッセージ - 発信元: #{from_number} - #{duration}秒",
      color: 'good',
      title: '新しい録音メッセージがあります',
      fields: [
        {
          title: '📞 発信元',
          value: from_number,
          short: true
        },
        {
          title: '⏱️ 録音時間',
          value: "#{duration}秒",
          short: true
        },
        {
          title: '📅 受信日時',
          value: created_at.strftime('%Y年%m月%d日 %H:%M'),
          short: true
        },
        {
          title: '🆔 録音ID',
          value: recording.sid,
          short: true
        }
      ],
      text: "録音を再生するには、以下の情報でアクセスしてください：\nURL: #{recording_url}\nユーザー名: #{account_sid}\nパスワード: Twilioコンソールで確認",
      footer: 'Twilio Voice',
      ts: Time.now.to_i
    }]
    
    # Slackメッセージを作成
    message = <<~MSG
      :telephone_receiver: *新しい録音メッセージ*
      
      :phone: 発信元: #{from_number}
      :dart: 発信先: #{to_number}
      :stopwatch: 録音時間: #{duration}秒
      :calendar: 受信日時: #{created_at.strftime('%Y年%m月%d日 %H:%M')}
      :id: 録音ID: #{recording.sid}
      
      録音URL: #{recording_url}
      (認証情報はTwilioコンソールで確認してください)
    MSG
    
    # Slackに送信
    response = slack.post message
    
    puts "Slack response: #{response.code} - #{response.body}"
    
    puts "Notified recording #{recording.sid} to Slack"
  end
  
  puts "Successfully notified #{recordings.length} recording(s) to Slack"
end
