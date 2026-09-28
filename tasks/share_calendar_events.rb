#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/token_store'

require 'slack/incoming/webhooks'

require 'multi_json'
require 'yaml'

OOB_URI          = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Ruby Quickstart'
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

# Token store backed by the YAML in ENV["GOOGLE_TOKENS"]. Keeps the tokens in
# memory so that they are never written to disk (not even temporarily).
class EnvTokenStore < Google::Auth::TokenStore
  def initialize(yaml)
    @store = YAML.safe_load(yaml)
  end

  def load(id)
    @store[id]
  end

  def store(id, token)
    @store[id] = token
  end

  def delete(id)
    @store.delete(id)
  end
end

def authorize
  client_id   = Google::Auth::ClientId.from_hash(MultiJson.load(ENV["GOOGLE_SECRETS"]))
  token_store = EnvTokenStore.new(ENV["GOOGLE_TOKENS"].gsub("%", "\'"))
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

  credentials
end

# Load the definitions above only when required from specs
return unless __FILE__ == $PROGRAM_NAME

# Notify to '#sandbox' if given arguments are matched.
is_test = false
case ARGV[0]
when 'SANDBOX' then
  slack = Slack::Incoming::Webhooks.new ENV['SLACK_CALENDAR_SANDBOX']
when 'TEST' then
  slack = Slack::Incoming::Webhooks.new ENV['SLACK_CALENDAR_SANDBOX']
  is_test = true
else
  # Notify in production.
  slack = Slack::Incoming::Webhooks.new ENV['SLACK_CALENDAR']
end


# Initialize the API
service = Google::Apis::CalendarV3::CalendarService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Fetch today's events for Google Calendar(s)
calendar_ids = ENV['GOOGLE_CALENDAR_IDS'].split(',')
responses    = []
calendar_ids.each do |calendar_id|
  today    = (Date.today + 0).strftime('%Y-%m-%dT00:00:00+09:00')
  tomorrow = (Date.today + 1).strftime('%Y-%m-%dT00:00:00+09:00')
  responses << service.list_events(
                        calendar_id,
                        time_min: today,
                        time_max: tomorrow,
                        single_events: true,
                        order_by: 'startTime')
end

# Generate a message
prefix = "本日の予定だよ！٩(ˊᗜˋ*)و \n"
msg    = ""
events = []
responses.each do |response|
  response.items.each do |event|
    # Skip cancelled events (e.g., deleted instances of recurring events)
    next if event.status == 'cancelled'

    next if event.start.nil?
    start = "00:00"  if event.start.date
    start = start    || event.start.date_time.strftime("%H:%M")
    events << { start: start, summary: event.summary.gsub(/\B@(\w+)/, '<@\1>') }
  end
end

events.sort_by{|e| e[:start].delete(':').to_i }.each do |event|
  next if event[:summary].include? "Private"
  msg += "• `#{event[:start]}` #{event[:summary]}\n"
end
msg.gsub!("00:00", " メモ ")

if is_test
  puts "✅ Test passed successfully."
elsif msg.empty?
  puts "✅ No events found today."
else
  puts "🆕 Found today's event(s)."
  slack.post prefix + msg
end
