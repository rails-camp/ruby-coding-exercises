require 'rspec'

def palindrome?(str)
end

describe 'palindrome?' do
  it 'returns boolean based on if a str is a palindrome' do
    expect(palindrome?('tacocat')).to eq(true)
    expect(palindrome?('Tacocat')).to eq(true)
    expect(palindrome?('racecar')).to eq(true)
    expect(palindrome?('raCecar')).to eq(true)

    expect(palindrome?('asdf')).to eq(false)
    expect(palindrome?('someOtherWord')).to eq(false)
  end
end

