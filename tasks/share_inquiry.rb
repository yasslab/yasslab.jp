#!/usr/bin/env ruby
#coding: utf-8

require 'idobata'
require 'gmail' # for more info -> http://dcparker.github.com/ruby-gmail/
require 'kconv'
require 'net/imap'
#require 'pry'

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
MAX_POST_SIZE    = 99998

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

  # 件名と送信先を取得
  if mail.subject.nil?
    text += "<b>件名なし</b><br>"
  else
    text += "<b>#{ mail.subject.toutf8 }</b><br>"
  end
  #mail_from = "#{ mail.from[0].mailbox  }@#{ mail.from[0].host }"
  #mail_type = 'To'
  #mail_to   = if !mail.to.nil?
  #              mail_type = 'To'
  #              "#{ mail.to[0].mailbox  }@#{ mail.to[0].host }"
  #            elsif !mail.cc.nil?
  #              mail_type = 'CC'
  #              "#{ mail.cc[0].mailbox  }@#{ mail.cc[0].host }"
  #            else
  #              mail_type = 'BCC'
  #              "#{ mail.bcc[0].mailbox }@#{ mail.bcc[0].host }"
  #            end

  # These lines below would be simple and better code than above
  mail_from = mail.reply.to.first
  mail_to   = mail.reply.from.first
  text += "<small><span class='label label-info'>From</span> #{mail_from} → <span class='label label-info'>To</span> #{mail_to}</small><br>"

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
  post = text.gsub(/((\n|\r))/, '')
    .gsub(/\s\s+/, ' ')
    .gsub("'", "\"")
    .gsub(/<!--(.*?)-->/, '')
    .gsub(/<style((.|\n|\r)*?)<\/style>/, '')

  # Truncate text if it exceeds MAX_POST_SIZE
  post = post[0..(MAX_POST_SIZE)] if post.size > MAX_POST_SIZE

  is_html_format ?
    Idobata::Message.create(source: post, format: :html) :
    Idobata::Message.create(source: post, format: :markdown)

  mail.mark(:read)
end

mails.empty? ?
  puts("✅ No inquiries found.") :
  puts("🆕 Found unread inquiry.")

@gmail.logout
