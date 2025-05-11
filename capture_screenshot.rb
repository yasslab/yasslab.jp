#!/usr/bin/env ruby
require 'selenium-webdriver'
require 'optparse'

def normalize_url(url)
  return url if url.start_with?('http://', 'https://')
  "https://#{url}"
end

def capture(url, path, options)
  driver = nil
  begin
    driver_options = Selenium::WebDriver::Chrome::Options.new
    driver_options.add_argument('--headless')
    driver_options.add_argument("--window-size=#{options[:width]},#{options[:height]}")
    driver = Selenium::WebDriver.for :chrome, options: driver_options
    driver.get(url)
    sleep options[:sleep]
    driver.save_screenshot(path)
  ensure
    driver&.quit
  end
end

# コマンドライン引数の解析
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby capture_screenshot.rb URL1 URL2 [options]"
  opts.on("-h", "--height HEIGHT", "スクリーンショットの高さ（デフォルト: 1000）") do |h|
    options[:height] = h.to_i
  end
  opts.on("-w", "--width WIDTH", "スクリーンショットの幅（デフォルト: 1280）") do |w|
    options[:width] = w.to_i
  end
  opts.on("-s", "--sleep SECONDS", "ページ読み込み待ち時間（デフォルト: 3）") do |s|
    options[:sleep] = s.to_i
  end
end.parse!

# デフォルト値の設定
options[:height] ||= 1000
options[:width]  ||= 1280
options[:sleep]  ||= 3

# 引数の検証
if ARGV.size != 2
  puts "Error: 2つのURLを指定してください"
  puts "Usage: ruby capture_screenshot.rb URL1 URL2 [options]"
  exit 1
end

url1, url2 = ARGV.map { |url| normalize_url(url) }

# 一時ファイル名の生成
timestamp = Time.now.strftime("%Y%m%d_%H%M%S")
file1 = "/tmp/screenshot_#{timestamp}_1.png"
file2 = "/tmp/screenshot_#{timestamp}_2.png"
diff_file = "/tmp/diff_#{timestamp}.png"

# 並行処理でスクリーンショットを取得
puts "Capturing screenshots in parallel..."
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
