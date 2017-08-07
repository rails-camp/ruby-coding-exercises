require 'rspec'

def smallest_word(word)

end

describe 'smallest_word' do
  it 'finds the smallest word in an array' do
    words = %w{here is a list of words}
    expect(smallest_word(words)).to eq('a')
  end
end
