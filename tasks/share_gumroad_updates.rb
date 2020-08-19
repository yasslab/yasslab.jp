#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

ENV['TZ'] = 'Asia/Tokyo'
unless Time.now.hour == 9 && Time.now.min >= 30
  puts 'Current Time: ' + Time.now.strftime("%H:%M")
  puts 'This task runs only 09:30..10:00. :sleeping:'
  return
end

require 'open-uri'
require 'date'
require 'json'
require 'idobata'

EMOJI_EYES = ":eyes: "
EMOJI_BAGS = ":moneybag: "

class Gumroad
  def initialize(token)
    @base_url       = "https://api.gumroad.com"
    @token_url      = "&access_token=#{token}"
    @start_page_url = "/v2/sales/?before=#{Date.today}&after=#{Date.today - 1}"
  end

  def sales_page_get(page_url)
    page_url ||= @start_page_url
    target_url = @base_url  + page_url + @token_url
    JSON.parse(URI.open(target_url).read)
  end
end

Idobata.hook_url = ENV['IDOBATA_GUMROAD']
gumroad          = Gumroad.new(ENV['GUMROAD_ACCESS_TOKEN'])

sales_data   = {}  #example: {"success":true,"sales":[....],"next_page_url":[]}
sales_count  = 0
sales_emojis = ""

loop do
  sales_data = gumroad.sales_page_get(sales_data['next_page_url'])
  sales_count += sales_data['sales'].size
  sales_data['sales'].each do |sale|
    if (unit = sale['price'].round(-3) / 1000) == 0
      sales_emojis << EMOJI_EYES
    else
      sales_emojis << EMOJI_BAGS * unit
    end
  end
  break if sales_data['next_page_url'].nil?
end

if sales_emojis.empty?
  puts "No updates this day."
else
  Idobata::Message.create(source: sales_emojis)
end
