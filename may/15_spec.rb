require 'rspec'

def smallest_word(words)
  words.min do |first_word, second_word|
    first_word.length <=> second_word.length
  end
end

describe 'smallest_word' do
  it 'finds the smallest word in an array' do
    words = %w{here is a list of words}
    expect(smallest_word(words)).to eq('a')
  end
end
