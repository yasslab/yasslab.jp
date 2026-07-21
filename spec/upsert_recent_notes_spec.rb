require_relative '../tasks/upsert_recent_notes'

# Regression test for the hourly note fetcher.
#
# Rake invokes the script as `ruby upsert_recent_notes.rb ''` when no count is
# given (nil.to_s.shellescape => "''"). Because '' is truthy in Ruby, the old
# `(ARGV[0] || '3').to_i` evaluated to `''.to_i` == 0, which made the fetch loop
# `break` on the first article and silently skip every new note.com article.
describe '#fetch_count' do
  it 'defaults to 3 when the argument is nil' do
    expect(fetch_count(nil)).to eq 3
  end

  it 'defaults to 3 when the argument is an empty string (Rake passes "")' do
    expect(fetch_count('')).to eq 3
  end

  it 'uses the given number when a numeric string is passed' do
    expect(fetch_count('5')).to eq 5
  end

  it 'respects a custom default' do
    expect(fetch_count(nil, 10)).to eq 10
  end
end

# note.com page <title> is "<title>｜YassLab 株式会社"; clean_note_title strips
# the company suffix so the English title (?hl=en) can be stored in news.yml.
describe '#clean_note_title' do
  it 'drops the ｜YassLab company suffix' do
    expect(clean_note_title('🤝 OSS Gate 10th Anniversary Conference Support｜YassLab 株式会社'))
      .to eq '🤝 OSS Gate 10th Anniversary Conference Support'
  end

  it 'keeps the title as-is when there is no separator' do
    expect(clean_note_title('Plain Title')).to eq 'Plain Title'
  end

  it 'returns nil for blank input' do
    expect(clean_note_title('')).to be_nil
    expect(clean_note_title(nil)).to be_nil
  end
end

# note.com は公開後に記事タイトルを編集することがある。以前は
# `next if urls.include?(item.link)` で既存 URL をスキップしていたため、
# タイトル変更が反映されなかった。update_entry_titles は該当エントリの
# title 行だけをその場で書き換え、手書きの YAML 整形（クォートの有無・
# キーのスペース幅・空行）を保つ。
describe '#update_entry_titles' do
  let(:yaml_text) do
    <<~YAML
      - title: '🌐 Old JP Title'
        title_en: '🌐 Old EN Title'
        date:  2026-07-21
        url:   https://note.com/yasslab/n/n541f711678c9

      - title: 別の記事はそのまま
        title_en: 'Another entry stays'
        date: 2026-07-10
        url: https://note.com/yasslab/n/naa68e1ad293a
    YAML
  end

  it 'updates the JP and EN titles of the matching entry only' do
    result = update_entry_titles(yaml_text,
                                 url: 'https://note.com/yasslab/n/n541f711678c9',
                                 title: '🌐 New JP Title',
                                 title_en: '🌐 New EN Title')
    expect(result).to include("- title: '🌐 New JP Title'")
    expect(result).to include("  title_en: '🌐 New EN Title'")
    # 他のエントリは変更されない。
    expect(result).to include('- title: 別の記事はそのまま')
    # date / url 行とそのスペーシングは保持される。
    expect(result).to include("  date:  2026-07-21\n  url:   https://note.com/yasslab/n/n541f711678c9")
  end

  it 'keeps the existing title_en when the new one is nil' do
    result = update_entry_titles(yaml_text,
                                 url: 'https://note.com/yasslab/n/n541f711678c9',
                                 title: '🌐 New JP Title',
                                 title_en: nil)
    expect(result).to include("- title: '🌐 New JP Title'")
    expect(result).to include("  title_en: '🌐 Old EN Title'")
  end

  it 'escapes single quotes in the new title' do
    result = update_entry_titles(yaml_text,
                                 url: 'https://note.com/yasslab/n/n541f711678c9',
                                 title: "It's updated",
                                 title_en: nil)
    expect(result).to include("- title: 'It''s updated'")
  end

  it 'returns the text unchanged when the url is not found' do
    result = update_entry_titles(yaml_text,
                                 url: 'https://note.com/yasslab/n/nonexistent',
                                 title: 'X',
                                 title_en: 'Y')
    expect(result).to eq yaml_text
  end
end

describe '#normalize_title' do
  it 'inserts a space after a glued emoji prefix' do
    expect(normalize_title('📕Rails Guides now supports Rails 7.2'))
      .to eq '📕 Rails Guides now supports Rails 7.2'
  end

  it 'leaves a properly spaced title unchanged' do
    expect(normalize_title('🆙 Training: Feedback Feature Added'))
      .to eq '🆙 Training: Feedback Feature Added'
  end

  it 'keeps a multi-emoji prefix that already has a space' do
    expect(normalize_title('👤→👥 Creating teams is easier'))
      .to eq '👤→👥 Creating teams is easier'
  end

  it 'leaves a non-emoji title unchanged' do
    expect(normalize_title('Rails 8 release notes')).to eq 'Rails 8 release notes'
  end

  it 'passes nil through' do
    expect(normalize_title(nil)).to be_nil
  end
end
