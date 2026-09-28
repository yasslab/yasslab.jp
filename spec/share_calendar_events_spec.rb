require 'json'
require_relative '../tasks/share_calendar_events'

# The OAuth tokens come from ENV (GitHub Secrets). They used to be written to
# tmp/calendar-tokens.yaml and deleted afterwards, which left a plaintext
# refresh token on disk whenever an exception occurred in between.
describe '#authorize' do
  let(:token_path) { File.join('tmp', 'calendar-tokens.yaml') }
  let(:token_json) do
    { client_id:              'dummy-client-id',
      access_token:           'dummy-access-token',
      refresh_token:          'dummy-refresh-token',
      scope:                  [SCOPE],
      expiration_time_millis: 0 }.to_json
  end

  around do |example|
    saved = ENV.to_h.slice('GOOGLE_SECRETS', 'GOOGLE_TOKENS')
    ENV['GOOGLE_SECRETS'] = { installed: { client_id: 'dummy-client-id', client_secret: 'dummy-secret' } }.to_json
    # GitHub Secrets store single quotes as '%' (see authorize)
    ENV['GOOGLE_TOKENS']  = "---\ndefault: %#{token_json}%\n"
    example.run
  ensure
    saved.each { |k, v| ENV[k] = v }
  end

  it 'returns credentials built from GOOGLE_TOKENS' do
    expect(authorize.refresh_token).to eq 'dummy-refresh-token'
  end

  it 'never writes the tokens to disk' do
    expect(File).not_to receive(:open).with(token_path, anything)
    expect(File).not_to receive(:write)
    authorize
  end
end
