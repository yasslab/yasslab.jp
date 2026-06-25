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
