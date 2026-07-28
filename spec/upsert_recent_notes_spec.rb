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

  # `title_en_draft: true` は「この英訳は note.com 公式ではなく YassLab 製」と
  # いう印。note.com 公式の英訳で差し替えたら事実と合わなくなるので外す。
  context 'when the entry carries a title translated on our side' do
    let(:yaml_text) do
      <<~YAML
        - title: '🤝 RailsTokyo#5 を支援'
          title_en: '🤝 Supporting RailsTokyo#5'
          title_en_draft: true
          date:  2026-07-10
          url:   https://note.com/yasslab/n/naa68e1ad293a

        - title: '🌐 別の記事'
          title_en: '🌐 Another entry'
          title_en_draft: true
          date:  2026-07-21
          url:   https://note.com/yasslab/n/n541f711678c9
      YAML
    end

    it 'drops the draft flag once an official translation replaces the draft' do
      result = update_entry_titles(yaml_text,
                                   url: 'https://note.com/yasslab/n/naa68e1ad293a',
                                   title: '🤝 RailsTokyo#5 を支援 (更新)',
                                   title_en: '🤝 Sponsoring RailsTokyo#5')
      expect(result).to include("  title_en: '🤝 Sponsoring RailsTokyo#5'\n  date:  2026-07-10")
      # 他のエントリの印は残る。
      expect(result.scan('title_en_draft: true').size).to eq 1
    end

    it 'keeps the draft flag when no official translation is available' do
      result = update_entry_titles(yaml_text,
                                   url: 'https://note.com/yasslab/n/naa68e1ad293a',
                                   title: '🤝 RailsTokyo#5 を支援 (更新)',
                                   title_en: nil)
      expect(result.scan('title_en_draft: true').size).to eq 2
    end
  end
end

# note.com の ?hl=en は、英語版が無い記事だと日本語タイトルをそのまま返す。
# 「英訳されたのか、日本語が返ってきただけなのか」を区別できず、過去に日本語が
# title_en に入り込んで英語ページに日本語タイトルが出た。
describe '#japanese?' do
  it 'detects hiragana, katakana, and kanji' do
    expect(japanese?('🤝 RailsTokyo#5 を支援')).to be true
    expect(japanese?('🌐 国際サミット「Raspberry Fields」の参加報告会に協賛')).to be true
    expect(japanese?('カタカナ')).to be true
  end

  it 'accepts an English title even when it carries emoji and symbols' do
    expect(japanese?('🤝 OSS Gate 10th Anniversary Conference Support')).to be false
    expect(japanese?('💎 RubyKaigi 2023 - "Kaigi is back!"')).to be false
  end

  it 'treats nil as not Japanese' do
    expect(japanese?(nil)).to be false
  end
end

# 英語版が無い記事は OpenAI で下訳する。下訳も得られないときに日本語を
# title_en に書くと英語ページが日本語のままになるため、nil を返して
# 呼び出し側に title_en ごと省略させる。
describe '#draft_title_en' do
  it 'returns nil when OPENAI_ACCESS_TOKEN is not set' do
    allow(ENV).to receive(:[]).and_call_original
    allow(ENV).to receive(:[]).with('OPENAI_ACCESS_TOKEN').and_return(nil)
    expect(draft_title_en('🤝 RailsTokyo#5 を支援')).to be_nil
  end
end

# 「note 公式の英訳」と「機械下訳」と「英訳なし」の3状態を切り分ける。
describe '#resolve_title_en' do
  let(:agent) { double('Mechanize') }
  let(:url)   { 'https://note.com/yasslab/n/n541f711678c9' }

  it 'uses the note.com translation when one exists' do
    allow(self).to receive(:note_title_en).and_return('🤝 OSS Gate 10th Anniversary Conference Support')
    expect(resolve_title_en(agent, url, '🤝 OSS Gate 10周年カンファレンス支援'))
      .to eq ['🤝 OSS Gate 10th Anniversary Conference Support', false]
  end

  it 'falls back to a drafted title when note.com returns the Japanese title' do
    allow(self).to receive(:note_title_en).and_return('🤝 RailsTokyo#5 を支援')
    allow(self).to receive(:draft_title_en).and_return('🤝 Supporting RailsTokyo#5')
    expect(resolve_title_en(agent, url, '🤝 RailsTokyo#5 を支援'))
      .to eq ['🤝 Supporting RailsTokyo#5', true]
  end

  it 'returns no title at all when neither note.com nor the draft provides English' do
    allow(self).to receive(:note_title_en).and_return('🤝 RailsTokyo#5 を支援')
    allow(self).to receive(:draft_title_en).and_return(nil)
    expect(resolve_title_en(agent, url, '🤝 RailsTokyo#5 を支援')).to eq [nil, false]
  end

  it 'drafts a title when note.com cannot be reached at all' do
    allow(self).to receive(:note_title_en).and_return(nil)
    allow(self).to receive(:draft_title_en).and_return('🤝 Supporting RailsTokyo#5')
    expect(resolve_title_en(agent, url, '🤝 RailsTokyo#5 を支援'))
      .to eq ['🤝 Supporting RailsTokyo#5', true]
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
