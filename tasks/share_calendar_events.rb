#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'idobata'
require 'fileutils'
require 'multi_json'

OOB_URI          = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Ruby Quickstart'
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

# Notify to '#sandbox' if given arguments are matched.
is_test = false
case ARGV[0]
when 'SANDBOX' then
  Idobata.hook_url = ENV['IDOBATA_CALENDAR_SANDBOX']
when 'TEST' then
  Idobata.hook_url = ENV['IDOBATA_CALENDAR_SANDBOX']
  is_test = true
else
  # Notify in production.
  Idobata.hook_url = ENV['IDOBATA_CALENDAR']
end

# TODO: Want to load from ENV but needs to call YAML::Store for auth
module Google
  module Auth
    module Stores
      # Implementation of user token storage backed by a local YAML file
      #class FileTokenStore < Google::Auth::TokenStore
      class FileTokenStore
        # @param [String, File] file
        #  Path to storage file
        #def initialize(options = {})
        #  path   = options[:file]
        #  @store = YAML::Store.new(path)
        #end

        # Implementation of user token storage backed by env variable with YAML format
        def initialize(options = {})
          token_path = options[:file]
          @store = YAML::Store.new(token_path)

          # TODO: Want to call like this but failed. Need to investigate YAML::Store
          # @store = YAML.load(ENV["GOOGLE_TOKENS"].gsub("%", "\'"))
        end
        # Create a new store with the supplied file.
      end
    end
  end
end

TOKEN_PATH = File.join("./", 'tmp', "calendar-tokens.yaml")
def authorize
  client_id = Google::Auth::ClientId.from_hash(MultiJson.load(ENV["GOOGLE_SECRETS"]))

  FileUtils.mkdir_p(File.dirname TOKEN_PATH)
  File.open(TOKEN_PATH, "w") do |f|
    y = ENV["GOOGLE_TOKENS"].gsub("%", "\'")
    f.write y
  end
  token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
  authorizer  = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)

  user_id     = 'default' # Set 'key' of yaml file
  credentials = authorizer.get_credentials(user_id)

  # NOTE: Run this locally if you need to refresh credentials
  #if credentials.nil?
  #  url = authorizer.get_authorization_url(base_url: OOB_URI)
  #  puts 'Open the following URL in the browser and enter the ' +
  #       'resulting code after authorization'
  #  puts url
  #  code = gets
  #  credentials = authorizer.get_and_store_credentials_from_code(
  #    user_id: user_id, code: code, base_url: OOB_URI)
  #end

  # Override text before file deletion to delete completely
  File.open(TOKEN_PATH, "w") {|f| f.write 'SECRETS!' }
  File.delete(TOKEN_PATH)

  credentials
end

# Initialize the API
service = Google::Apis::CalendarV3::CalendarService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Fetch today's events for Google Calendar(s)
calendar_ids = ENV['GOOGLE_CALENDAR_IDS'].split(',')
responses    = []
calendar_ids.each do |calendar_id|
  today    = (Date.today).strftime('%Y-%m-%dT00:00:00+09:00')
  tomorrow = (Date.today + 1).strftime('%Y-%m-%dT00:00:00+09:00')
  responses << service.list_events(
                        calendar_id,
                        time_min: today,
                        time_max: tomorrow)
end

# Generate a message
msg    = ""
events = []
responses.each do |response|
  response.items.each do |event|
    next if event.start.nil?
    start = "00:00"  if event.start.date
    start = start    || event.start.date_time.strftime("%H:%M")
    events << { start: start, summary: event.summary }
  end
end

events.sort_by{|h| h[:start].delete(':').to_i }.each do |hash|
  next if hash[:summary].include? "Private"
  msg += "<span class='label label-info'>#{hash[:start]}</span> #{hash[:summary]}<br>"
end
msg.gsub!("00:00", "&nbsp;メモ&nbsp;")

if is_test
  puts "✅ Test passed successfully."
elsif msg.empty?
  puts "✅ No events found today."
else
  puts "🆕 Found today's event(s)."
  Idobata::Message.create(source: msg, format: :html) unless msg.empty?
end
