require 'spec_helper'
require 'yaml'

# Heroku の API キーを第三者の action に渡さないよう、自前の yasslab/heroku_deploy_action でデプロイする。
# 自前の action は --force を使わないので、古い回が後に動いた時（続けてマージした時・スケジューラと重なった時）も
# Heroku に拒否され、本番は古いコミットに戻らない。全経路が同じ版を SHA で固定して使うことを、ここで守る
RSpec.describe 'Heroku へのデプロイの設定' do
  workflows = Dir.glob(File.expand_path('../.github/workflows/*.yml', __dir__)).sort

  # 以前の akhileshns/heroku-deploy が残っていても見つけられるよう、両方を拾う
  steps = workflows.flat_map do |path|
    YAML.safe_load_file(path).fetch('jobs').flat_map do |_, job|
      Array(job['steps'])
        .select { |step| step['uses'].to_s.match?(%r{\A(?:yasslab/heroku_deploy_action|akhileshns/heroku-deploy)@}) }
        .map    { |step| [File.basename(path), step] }
    end
  end

  it 'Heroku へデプロイする手順がある' do
    expect(steps.map(&:first)).to include('ci.yml')
  end

  it '全経路が、自前の action の同じ版を SHA で固定して使う' do
    expect(steps.map { |_, step| step['uses'] }.uniq).to contain_exactly(match(%r{\Ayasslab/heroku_deploy_action@\h{40}\z}))
  end
end
