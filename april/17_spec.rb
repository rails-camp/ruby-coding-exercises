require 'rspec'

describe 'friendly_counter' do
  it 'can group a sequence of letters' do
    expect('aaabbbbbbccc'.friendly_counter).to eq("three a's, six b's, three c's")
  end

  it 'can group a sequence of letters that are unsorted' do
    expect('aabbcccca'.friendly_counter).to eq("three a's, two b's, four c's")
  end

  it 'can group a sequence of string based integers' do
    expect('14832131'.friendly_counter).to eq("three 1's, one 4, one 8, two 3's, one 2")
  end
end

