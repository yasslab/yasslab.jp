#!/usr/bin/env ruby
require 'selenium-webdriver'
require 'optparse'

def normalize_url(url)
  return url if url.start_with?('http://', 'https://')
  "https://#{url}"
end

def build_url(domain, path)
  # パスの先頭に / がない場合は追加
  path = "/#{path}" unless path.start_with?('/')
  normalize_url("#{domain}#{path}")
end

def capture(url, path, options)
  driver = nil
  begin
    driver_options = Selenium::WebDriver::Chrome::Options.new
    driver_options.add_argument('--headless')
    driver_options.add_argument("--window-size=#{options[:width]},#{options[:height]}")
    # パフォーマンス最適化のための設定を追加
    driver_options.add_argument('--disable-gpu')
    driver_options.add_argument('--no-sandbox')
    driver_options.add_argument('--disable-dev-shm-usage')
    driver_options.add_argument('--disable-extensions')
    driver_options.add_argument('--disable-software-rasterizer')
    driver_options.add_argument('--disable-features=VizDisplayCompositor')
    driver_options.add_argument('--disable-features=IsolateOrigins,site-per-process')
    
    driver = Selenium::WebDriver.for :chrome, options: driver_options
    
    # ページ読み込みの最適化
    driver.manage.timeouts.page_load = options[:timeout]
    driver.manage.timeouts.implicit_wait = 1
    
    driver.get(url)
    
    # ページの読み込み完了を待機
    wait = Selenium::WebDriver::Wait.new(timeout: options[:timeout])
    wait.until { driver.execute_script('return document.readyState') == 'complete' }
    
    # 追加の待機時間（必要な場合のみ）
    sleep options[:sleep] if options[:sleep] > 0
    
    driver.save_screenshot(path)
  ensure
    driver&.quit
  end
end

# コマンドライン引数の解析
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby capture_screenshot.rb PATH DOMAIN1 DOMAIN2 [options]"
  opts.on("-h", "--height HEIGHT", "スクリーンショットの高さ（デフォルト: 1000）") do |h|
    options[:height] = h.to_i
  end
  opts.on("-w", "--width WIDTH", "スクリーンショットの幅（デフォルト: 1280）") do |w|
    options[:width] = w.to_i
  end
  opts.on("-s", "--sleep SECONDS", "ページ読み込み待ち時間（デフォルト: 0）") do |s|
    options[:sleep] = s.to_i
  end
  opts.on("-t", "--timeout SECONDS", "ページ読み込みタイムアウト（デフォルト: 10）") do |t|
    options[:timeout] = t.to_i
  end
end.parse!

# デフォルト値の設定
options[:height] ||= 1000
options[:width]  ||= 1280
options[:sleep]  ||= 0
options[:timeout] ||= 10

# 引数の検証
if ARGV.size != 3
  puts "Error: ファイルパスと2つのドメインを指定してください"
  puts "Usage: ruby capture_screenshot.rb PATH DOMAIN1 DOMAIN2 [options]"
  exit 1
end

path, domain1, domain2 = ARGV
url1 = build_url(domain1, path)
url2 = build_url(domain2, path)

# 一時ファイル名の生成
timestamp = Time.now.strftime("%Y%m%d_%H%M%S")
file1 = "/tmp/screenshot_#{timestamp}_1.png"
file2 = "/tmp/screenshot_#{timestamp}_2.png"
diff_file = "/tmp/diff_#{timestamp}.png"

# 並行処理でスクリーンショットを取得
puts "Capturing screenshots in parallel..."
puts "URL1: #{url1}"
puts "URL2: #{url2}"
start_time = Time.now

threads = []
threads << Thread.new do
  puts "Capturing #{url1}..."
  capture(url1, file1, options)
end

threads << Thread.new do
  puts "Capturing #{url2}..."
  capture(url2, file2, options)
end

threads.each(&:join)

end_time = Time.now
puts "Capture completed in #{end_time - start_time} seconds"

# 差分の比較
puts "\nComparing screenshots..."
result = `compare -metric AE #{file1} #{file2} #{diff_file} 2>&1`
diff = result.to_f

# Differenceを表示し、基準を超えたら「(OK)」、そうでないなら「(NG)」と表示
if diff < 1_000_000
  puts "Difference: #{result} (OK)"
else
  puts "Difference: #{result} (NG)"
end

# ファイルサイズの表示
puts "\nFile sizes:"
puts `ls -lh #{file1} #{file2} #{diff_file}`

puts "\nFiles saved in /tmp:"
puts "Screenshot 1: #{file1}"
puts "Screenshot 2: #{file2}"
puts "Diff image: #{diff_file}"
