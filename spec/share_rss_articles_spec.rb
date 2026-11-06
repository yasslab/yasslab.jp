require 'rss'
require 'tmpdir'
require_relative '../tasks/share_rss_articles'

# Ruby Weekly の RSS は pubDate が 00:00 UTC 固定で、号が RSS に出るのはその後になる。
# 「直近 60 分」の判定では拾えないので、前回投稿した号の番号と比べて新しい号を拾う。
RubyWeeklyItem = Struct.new(:link, :title)

# 同じ回に 2 つの RSS で新着があっても、記事ごとに行が分かれること
describe '#slack_message' do
  it 'joins articles from different feeds with a newline' do
    hatena    = ["<https://example.com/a|A> by `Hatena Bookmark`\n> desc A"]
    techracho = ["<https://example.com/b|B> by `TechRacho`\n> desc B"]
    expect(slack_message([hatena, techracho])).to eq "#{hatena.first}\n#{techracho.first}"
  end

  it 'skips feeds without new articles' do
    expect(slack_message([[], ['<https://example.com/a|A>'], []])).to eq '<https://example.com/a|A>'
  end

  it 'returns an empty string when no feed has new articles' do
    expect(slack_message([[], []])).to eq ''
  end
end

describe 'Ruby Weekly' do
  let(:items) do
    [
      RubyWeeklyItem.new('https://rubyweekly.com/issues/825', 'Issue 825'),
      RubyWeeklyItem.new('https://rubyweekly.com/issues/824', 'Issue 824'),
      RubyWeeklyItem.new('https://rubyweekly.com/issues/823', 'Issue 823'),
    ]
  end

  describe '#ruby_weekly_issue_number' do
    it 'returns the issue number in the link' do
      expect(ruby_weekly_issue_number('https://rubyweekly.com/issues/825')).to eq 825
    end

    it 'returns nil for a link without an issue number' do
      expect(ruby_weekly_issue_number('https://rubyweekly.com/')).to be_nil
    end
  end

  describe '#new_ruby_weekly_items' do
    it 'returns issues newer than the last posted one, oldest first' do
      expect(new_ruby_weekly_items(items, 823).map(&:title)).to eq ['Issue 824', 'Issue 825']
    end

    it 'returns nothing when the latest issue was already posted' do
      expect(new_ruby_weekly_items(items, 825)).to be_empty
    end

    # cache が消えた時は最新号だけを投稿する（重複は 1 回で済み、過去の号を流さない）
    it 'returns only the latest issue when nothing is remembered' do
      expect(new_ruby_weekly_items(items, nil).map(&:title)).to eq ['Issue 825']
    end
  end

  describe '#last_ruby_weekly_issue / #save_ruby_weekly_issue' do
    let(:path) { File.join(Dir.mktmpdir, 'ruby_weekly_last_issue') }

    it 'returns nil when the state file does not exist' do
      expect(last_ruby_weekly_issue(path)).to be_nil
    end

    it 'reads back the saved issue number' do
      save_ruby_weekly_issue(path, 825)
      expect(last_ruby_weekly_issue(path)).to eq 825
    end
  end

  it 'parses the real feed format (pubDate fixed at 00:00 UTC)' do
    xml = <<~RSS
      <?xml version="1.0" encoding="UTF-8"?>
      <rss version="2.0"><channel><title>Ruby Weekly</title><link>https://rubyweekly.com/</link><description>x</description>
        <item><title>Patch Rails now</title><link>https://rubyweekly.com/issues/825</link><description>&lt;table&gt;&lt;/table&gt;</description><pubDate>Thu, 5 Nov 2026 00:00:00 +0000</pubDate></item>
        <item><title>Older</title><link>https://rubyweekly.com/issues/824</link><description>x</description><pubDate>Thu, 29 Oct 2026 00:00:00 +0000</pubDate></item>
      </channel></rss>
    RSS
    feed_items = RSS::Parser.parse(xml, false).items
    expect(new_ruby_weekly_items(feed_items, 824).map(&:title)).to eq ['Patch Rails now']
  end
end
