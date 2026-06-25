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
