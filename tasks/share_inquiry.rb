#!/usr/bin/env ruby
#coding: utf-8

require 'idobata'
require 'gmail' # for more info -> http://dcparker.github.com/ruby-gmail/
require 'kconv'

Signal.trap(:INT){
  puts "logout Gmail ..."
  @gmail.logout if defined? @gmail
  puts "logged out!"
  exit
}

def attached_file_exist?(filename)
  if File.exist?(filename)
    puts "checked the given file '#{filename}' exists."
  else
    puts "it seems '#{filename}' doesn not exist."
    puts "check if the file really exists on the given path."
    exit
  end
end

Idobata.hook_url = ENV['IDOBATA_MAILS']
USERNAME         = ENV['GMAIL_USERNAME']
PASSWORD         = ENV['GMAIL_PASSWORD']


# login, confirm, then send/cancel and logout
@gmail = Gmail.new(USERNAME, PASSWORD)

#emailsの引数には:all,:read,:unreadがある.
mails = @gmail.inbox.emails(:unread).each do |mail|
  text = ''
  is_html_format = false

  #text  += "<li>件名:   #{mail.subject}</li>"
  #text  += "<li>日付:   #{mail.date}</li>"
  #text  += "<li>送信者: #{mail.from.first.to_a.first}</li>"
  #text  += "<li>受信者: #{mail.to}</li>" # この情報はいらない？

  if mail.subject.nil?
    text += "<b>件名なし</b><br>"
  else
    text += "<b>#{mail.subject.toutf8}</b><br>"
  end

  begin
    #件名、日付、From、To、本文処理
    if !mail.text_part && !mail.html_part
      text += mail.body.decoded.encode('UTF-8', mail.charset, invalid: :replace, undef: :replace)
    elsif mail.html_part
      text += mail.html_part.decoded
      is_html_format = true
    elsif mail.text_part
      text += mail.text_part.decoded
    end
  rescue => e
    # エンコーディングで例外が発生したら、それも含める
    text += e.message
  end

  # puts text[3..].split('</b>').first # for debug print: mail.subject
  post = text.gsub("\n", "").gsub("'", "\"").gsub(/<!--(.*?)-->/, '')
  is_html_format ?
    Idobata::Message.create(source: post, format: :html) :
    Idobata::Message.create(source: post, format: :markdown)
  mail.mark(:read)
end

mails.empty? ?
  puts("✅ No inquiries found.") :
  puts("🆕 Found unread inquiry.")

@gmail.logout
