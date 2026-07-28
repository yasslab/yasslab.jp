require 'yaml'

# Every news title that starts with an emoji must have a whitespace right after
# that emoji prefix, e.g. "📕 Rails Guides" (good) not "📕Rails Guides" (bad).
# Applies to both the Japanese `title` and the English `title_en`.
describe 'news.yml title formatting' do
  let(:news) { YAML.unsafe_load_file('_data/news.yml') }

  # True only when the title starts with an emoji/symbol run but lacks a following space.
  def missing_space_after_emoji?(str)
    clusters = str.to_s.grapheme_clusters
    run = 0
    run += 1 while clusters[run] && clusters[run].match?(/\p{S}/) # consume leading emoji/symbol run
    return false if run.zero?          # not emoji-prefixed -> nothing to enforce
    return false if clusters[run].nil? # title is only emoji
    !clusters[run].match?(/\p{Space}/) # must be followed by some whitespace
  end

  %w[title title_en].each do |field|
    it "has a space after the leading emoji in every #{field}" do
      offenders = news.filter_map { |n| n[field] }.select { |t| missing_space_after_emoji?(t) }
      expect(offenders).to be_empty,
        "Missing space after emoji prefix:\n#{offenders.join("\n")}"
    end
  end
end

# note.com は英語版を持たない記事だと ?hl=en でも日本語タイトルを返すため、
# それをそのまま title_en に保存すると英語ページに日本語タイトルが並ぶ。
# 実際に 2 件（RailsTokyo#5 / Raspberry Fields）がこの状態で公開されていた。
describe 'news.yml English titles' do
  let(:news) { YAML.unsafe_load_file('_data/news.yml') }

  it 'has no Japanese characters in any title_en' do
    offenders = news.select { |n| n['title_en'].to_s.match?(/[\p{Hiragana}\p{Katakana}\p{Han}]/) }
    expect(offenders).to be_empty,
      "title_en is still Japanese:\n#{offenders.map { |n| "#{n['date']}  #{n['title_en']}" }.join("\n")}"
  end

  # `title_en_draft: true` は「note.com 公式ではなく YassLab 製の英訳」という印。
  # 印だけあって中身が無いと、レビュー対象を洗い出すときに実体を追えなくなる。
  it 'never flags an entry as a draft without an English title to review' do
    offenders = news.select { |n| n['title_en_draft'] && n['title_en'].to_s.empty? }
    expect(offenders).to be_empty,
      "title_en_draft without title_en:\n#{offenders.map { |n| n['title'] }.join("\n")}"
  end
end
