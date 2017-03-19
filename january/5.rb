require 'rspec'

# https://www.crondose.com/2017/01/coding-exercise-generate-alphabet-ruby/

def generate_alphabet
  ('a'..'z').to_a
end

describe 'Alphabet generator' do
  it 'generates the full alphabet' do
    expect(generate_alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"])
  end
end
