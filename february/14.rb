require 'rspec'

describe 'Vowel remover' do
  it 'removes vowels from the alphabet' do
    alphabet = ('a'..'z')
    expect(vowel_remover(alphabet)).to eq(["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"])
  end
end

