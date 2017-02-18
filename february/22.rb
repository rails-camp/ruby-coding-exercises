require 'rspec'

def largest_words strings, num
  strings.max_by(num) do |str|
    str.length
  end
end

describe 'Largest words' do
  it 'returns the largest words from an array' do
    strings = %w{a group of words that are variable length}
    expect(largest_words strings, 3).to eq(["variable", "length", "words"])
  end
end
