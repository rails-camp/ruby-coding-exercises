require 'rspec'

class Array
  def largest_word
    flat_map(&:split).max_by(&:length)
  end
end

describe 'Word max' do
  it 'returns the longest word from an array' do
    arr = ['A sentence', 'broken into several', 'array elements']
    expect(arr.largest_word).to eq('sentence')
  end
end

