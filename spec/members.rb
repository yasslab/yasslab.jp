require 'spec_helper'
require 'net/http'
require 'json'

RSpec.describe '/members.json' do
  before(:all) do
    # Build Jekyll site
    system('bundle exec jekyll build')
    
    # Load members.json
    members_json_path = File.join(File.dirname(__FILE__), '..', '_site', 'members.json')
    @members = JSON.parse(File.read(members_json_path))
  end

  it 'returns an array of members' do
    expect(@members).to be_an(Array)
    expect(@members).not_to be_empty
  end

  it 'each member has a username' do
    @members.each do |member|
      expect(member).to have_key('username')
      expect(member['username']).to be_a(String)
      expect(member['username']).not_to be_empty
    end
  end

  context 'GitHub API validation' do
    it 'all members have valid GitHub accounts' do
      @members.each do |member|
        uri = URI("https://api.github.com/users/#{member['username']}")
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        
        # Valid GitHub user should not have "message": "Not Found"
        expect(data).not_to have_key('message')
        expect(data['message']).not_to eq('Not Found') if data.has_key?('message')
        
        # Valid GitHub user should have login field
        expect(data).to have_key('login')
        expect(data['login'].downcase).to eq(member['username'].downcase)
      end
    end
  end
end