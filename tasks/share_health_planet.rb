#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'idobata'
require 'mechanize'
require 'json'
require 'csv'
#require 'pry'

Idobata.hook_url = ENV['IDOBATA_HEALTH']
ACCESS_TOKEN     = ENV['HEALTH_PLANET_TOKEN']
LABEL_COLOR      = ENV['LABEL_COLOR'] || "label-success"
USER_NAME        = ENV['USER_NAME']   || "yasulab"
TIME_INTERVAL    = 60 # minutes

# To generate ACCESS_TOKEN, see `sample_token_getter.rb`.
# cf. https://github.com/yasslab/hp2idobata
#REDIRECT_URI  = 'localhost'
#CLIENT_ID     = ENV['CLIENT_ID']
#CLIENT_SECRET = ENV['CLIENT_SECRET'],
#AUTH_CODE = ENV['AUTH_CODE']

# NOTE: Health Planet now returns weight (6021) only.
#TAG2NAME     = {
#  '6021' => '体重',       '6022' => '体脂肪率',       '6023' => '筋肉量',
#  '6024' => '筋肉スコア', '6025' => '内臓脂肪レベル', '6026' => '内臓脂肪レベル',
#  '6027' => '基礎代謝量', '6028' => '体内年齢',       '6029' => '推定骨量' }
#TAG2UNIT     = {
#  '6021' => 'kg',   '6022' => '%',      '6023' => 'kg',
#  '6024' => '点',   '6025' => 'レベル', '6026' => 'レベル',
#  '6027' => 'kcal', '6028' => '歳',     '6029' => 'kg' }
#TAG_PARAMS   = 6

TAG          = 6021,6022,6023,6026,6027,6028
DATE_TYPE    = 0
FROM_DATE    = (Time.now - 60*TIME_INTERVAL).strftime("%Y%m%d%H%M%S") # fetch data in the given interval
TO_DATE      = Time.now.strftime("%Y%m%d%H%M%S")
#FROM_DATE    = "20160114000000"  # Sample Date Format
#TO_DATE      = "20160114235900"  # Sample Date Format

# Generate agent and get data via ACCESS_TOKEN
agent = Mechanize.new
agent.user_agent_alias = 'Windows IE 9'

url = "https://www.healthplanet.jp/status/innerscan.xml?access_token=#{ACCESS_TOKEN}&date=#{DATE_TYPE}&tag=#{TAG}&from=#{FROM_DATE}&to=#{TO_DATE}"

# Call API and check data
result  = agent.get(url)
data    = result.xml.search("//data")
if data.empty?
  puts("✅ No record found.")
  return
else
  puts("🆕 Found new record(s).")
end

# Fetch each datum if exists
date     = data.first.at_xpath("date").text
weight   = data.first.at_xpath("keydata").text
body_fat = data.last.at_xpath("keydata").text

# Generate message to send Idobata
msg = ""
msg << "<span class='label #{LABEL_COLOR}'>#{USER_NAME}</span> が体重を測りました<br> \n"
msg << "日付: "     + DateTime.parse(date).strftime("%Y年%m月%d日 %H:%M") + "<br>"
msg << "体重: "     + weight + "kg <br>"
msg << "体脂肪率: " + body_fat + "% <br>"

# Send the message as HTML
Idobata::Message.create(source: msg, format: :html) unless msg.empty?
