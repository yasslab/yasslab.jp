require 'spec_helper'
require 'webrick'
require_relative '../tasks/check_uptime'

# 本番を叩かず、手元の WEBrick に向けて死活監視の判定を確かめる
RSpec.describe 'Uptime' do
  before(:all) do
    @server = WEBrick::HTTPServer.new(Port: 0, BindAddress: '127.0.0.1', Logger: WEBrick::Log.new(File::NULL), AccessLog: [])
    @server.mount_proc('/health')    { |_, res| res.body = 'ok' }
    @server.mount_proc('/title')     { |_, res| res.body = '<title>YassLab 株式会社 - Having a Good Life</title>' }
    @server.mount_proc('/down')      { |_, res| res.status = 503; res.body = 'Application Error' }
    @server.mount_proc('/redirect')  { |_, res| res.status = 301; res['Location'] = 'https://yasslab.jp/' }
    @thread = Thread.new { @server.start }
    @base   = "http://127.0.0.1:#{@server.config[:Port]}"
  end

  after(:all) do
    @server.shutdown
    @thread.join
  end

  def problem(path, status: 200, body: nil, location: nil)
    Uptime.problem("#{@base}#{path}", status: status, body: body, location: location, attempts: 1)
  end

  it 'returns nil when the status and the body match' do
    expect(problem('/health', body: 'ok')).to be_nil
  end

  it 'compares the body as UTF-8' do
    expect(problem('/title', body: '<title>YassLab 株式会社')).to be_nil
  end

  it 'reports an unexpected status' do
    expect(problem('/down', body: 'ok')).to include('503')
  end

  it 'reports a missing marker in the body' do
    expect(problem('/health', body: 'YassLab')).to include('YassLab')
  end

  it 'checks the location of a redirect' do
    expect(problem('/redirect', status: 301, location: 'https://yasslab.jp/')).to be_nil
    expect(problem('/redirect', status: 301, location: 'https://example.com/')).to include('https://example.com/')
  end

  it 'reports a connection error instead of raising it' do
    expect(Uptime.problem('http://127.0.0.1:1/', attempts: 1)).to include('127.0.0.1:1')
  end

  it 'retries before reporting a problem' do
    calls = 0
    allow(Uptime).to receive(:fetch).and_wrap_original { |original, *args| calls += 1; original.call(*args) }
    Uptime.problem("#{@base}/down", attempts: 3, wait: 0)
    expect(calls).to eq(3)
  end

  describe '.certificate_problem' do
    it 'reports a certificate that expires soon' do
      expect(Uptime.certificate_problem('yasslab.jp', Time.now + 3 * 86400, days: 14)).to include('3')
    end

    it 'returns nil for a certificate valid long enough' do
      expect(Uptime.certificate_problem('yasslab.jp', Time.now + 30 * 86400, days: 14)).to be_nil
    end
  end
end
