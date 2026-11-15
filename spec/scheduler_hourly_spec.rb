require 'spec_helper'
require 'yaml'

# 毎時の定期実行は、外部の RSS など前の手順が落ちても、後ろの手順を止めない。
# Twilio の着信通知は「過去 1 時間の録音」を読むので、飛ばされた時間の通知は次の回で取り戻せない
RSpec.describe 'Scheduler for Hourly Tasks' do
  workflow = YAML.load_file(File.expand_path('../.github/workflows/scheduler_hourly.yml', __dir__))
  steps    = workflow.dig('jobs', 'build', 'steps')
  step     = ->(prefix) { steps.find { |s| s['name'].include?(prefix) } or raise "step not found: #{prefix}" }

  ['Notify Twilio events', 'Upsert recent news'].each do |name|
    it "runs '#{name}' even if an earlier step failed" do
      expect(step.(name)['if']).to include('!cancelled()')
    end
  end

  it 'deploys only when the upsert itself succeeded with news' do
    ['Set up Heroku CLI', 'Deploy to Heroku'].each do |name|
      condition = step.(name)['if']
      expect(condition).to include('!cancelled()')
      expect(condition).to include("steps.upsert.outcome == 'success'")
      expect(condition).to include("env.HAS_NEWS == 'true'")
    end
  end

  it 'verifies the release only after the deploy succeeded' do
    condition = step.('Verify the release')['if']
    expect(condition).to include('!cancelled()')
    expect(condition).to include("steps.deploy.outcome == 'success'")
  end

  it 'still notifies Slack when any step failed' do
    expect(step.('Notify failure to Slack')['if']).to eq('failure()')
  end

  # 手元で確かめるための dry run を本番で効かせない（投稿が止まる・過去の記事を投稿し直す）
  it 'never runs the RSS step as a dry run' do
    workflow_text = File.read(File.expand_path('../.github/workflows/scheduler_hourly.yml', __dir__))
    expect(workflow_text).not_to include('SHARE_DRY_RUN')
    expect(workflow_text).not_to include('SHARE_LOOKBACK_HOURS')
  end
end
