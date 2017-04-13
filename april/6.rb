require 'rspec'

describe LineCounter do
  it 'counts the number of lines in a file' do
    expect(LineCounter.line_count('support/line_counter.txt')).to eq(42)
  end
end
