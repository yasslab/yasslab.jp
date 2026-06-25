require_relative '../tasks/upsert_recent_press'

# Defensive regression test for the hourly press fetcher.
#
# upsert_recent_press is currently safe because its Rake task does not
# shellescape a nil argument, but it shares the same `(ARGV[0] || '3')`
# pitfall that broke upsert_recent_notes. This locks in robust parsing so a
# future Rakefile "cleanup" cannot reintroduce the '' -> 0 -> skip-all bug.
describe '#fetch_count' do
  it 'defaults to 3 when the argument is nil' do
    expect(fetch_count(nil)).to eq 3
  end

  it 'defaults to 3 when the argument is an empty string (Rake may pass "")' do
    expect(fetch_count('')).to eq 3
  end

  it 'uses the given number when a numeric string is passed' do
    expect(fetch_count('5')).to eq 5
  end

  it 'respects a custom default' do
    expect(fetch_count(nil, 10)).to eq 10
  end
end
