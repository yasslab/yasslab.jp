require 'spec_helper'
require_relative '../tasks/verify_heroku_release'

# heroku-deploy は Heroku 側でビルドが飛ばされても緑になる (coderdojo-japan/coderdojo.jp#1848)。
# デプロイ後に、そのコミットのリリースが succeeded になったかを確かめる
RSpec.describe 'HerokuRelease.deployed?' do
  sha = '1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0b'

  def release(description, status = 'succeeded') = { 'description' => description, 'status' => status }

  it 'is true when the commit was released successfully' do
    releases = [release('Deploy 1a2b3c4d'), release('Deploy 99999999')]
    expect(HerokuRelease.deployed?(releases, sha)).to be true
  end

  it 'is false when the build was skipped and no release has the commit' do
    releases = [release('Deploy 99999999'), release('Set FOO config vars')]
    expect(HerokuRelease.deployed?(releases, sha)).to be false
  end

  it 'is false when the release of the commit failed' do
    releases = [release('Deploy 1a2b3c4d', 'failed')]
    expect(HerokuRelease.deployed?(releases, sha)).to be false
  end

  it 'does not match another commit that only shares a prefix in the middle' do
    releases = [release('Deploy 001a2b3c')]
    expect(HerokuRelease.deployed?(releases, sha)).to be false
  end
end

RSpec.describe 'HerokuRelease.request' do
  # Net::HTTP は gzip を求めておきながら、Content-Range 付き (206) の応答は解凍しない。
  # gzip のまま JSON.parse して落ちた (2026年10月14日の main の deploy ジョブ)
  it 'does not ask for a compressed response' do
    request = HerokuRelease.request('yasslab-jp', 'dummy', max: 5)
    expect(request['Accept-Encoding']).to be_nil
    expect(request['Range']).to eq('version ..; order=desc, max=5')
  end
end
