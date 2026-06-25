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
