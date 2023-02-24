require 'net/http'
require 'uri'
require 'date'
require 'json'
require 'kconv'

#curl -sL https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv | iconv -f cp932
uri      = URI.parse("https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv")
response = Net::HTTP.get_response(uri)
holidays = response.body.toutf8.lines(chomp: true).to_a[1..].map{|l| Date.parse(l.split(',')[0]).to_s}
# holidays.first => "1955-01-01"
#p response.code
#p holidays

File.open('holidays.json', 'w') do |f|
  #JSON.dump(holidays, f)
  f.write(JSON.pretty_generate holidays)
end
