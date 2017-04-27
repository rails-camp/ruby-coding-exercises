require 'rspec'

describe 'Check if a Sentence Contains Every Letter in the Alphabet' do
  it 'returns true if the string contains at least one of every letter in the a-z alphabet' do
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    expect(has_all_letters?(alphabet)).to eq(true)
  end

  it 'returns false if the string does not contain at least one of every letter in the a-z alphabet' do
    not_the_alphabet = "abdefghijklmnopqrstuvwxyz"
    sentence = "Some words but not the full alphabet 123 $$ &"
    empty_string = ""
    expect(has_all_letters?(not_the_alphabet)).to eq(false)
    expect(has_all_letters?(sentence)).to eq(false)
    expect(has_all_letters?(empty_string)).to eq(false)
  end
end
