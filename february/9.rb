require 'rspec'

def weird_alphabet
  ('a'..'z').sort do |l, r|
    if l == 'k'
      1
    else
      l <=> r
    end
  end
end

describe 'Weird Alphabet' do
  it 'creates and sorts the alphabet, but places the letter k at the end' do
    expect(weird_alphabet.last).to eq('k')
    expect(weird_alphabet.first).to eq('a')
  end
end
