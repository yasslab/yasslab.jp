require 'spec_helper'
require 'yaml'

# heroku-deploy の dontuseforce の既定は false で、push が拒否されると --force で送り直す。
# 古い回が後に動いた時（続けてマージした時・スケジューラと重なった時）に、本番が古いコミットに戻らないようにする
RSpec.describe 'heroku-deploy の設定' do
  workflows = Dir.glob(File.expand_path('../.github/workflows/*.yml', __dir__)).sort

  steps = workflows.flat_map do |path|
    YAML.safe_load_file(path).fetch('jobs').flat_map do |_, job|
      Array(job['steps'])
        .select { |step| step['uses'].to_s.start_with?('akhileshns/heroku-deploy') }
        .map    { |step| [File.basename(path), step] }
    end
  end

  it 'Heroku へデプロイする手順がある' do
    expect(steps.map(&:first)).to include('ci.yml')
  end

  steps.each do |file, step|
    it "#{file} は --force で送り直さない" do
      expect(step['with']['dontuseforce']).to eq true
    end
  end
end
