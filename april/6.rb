require 'rspec'

module LineCounter
  def self.line_count(path)
    File.foreach(path).count
    #%x{wc -l '#{path}'}.to_i
  end
end

describe LineCounter do
  it 'counts the number of lines in a file' do
    expect(LineCounter.line_count('support/line_counter.txt')).to eq(42)
  end
end
