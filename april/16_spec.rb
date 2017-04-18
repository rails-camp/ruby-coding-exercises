require 'rspec'

describe 'group_by_character' do
  it 'can group a sequence of letters' do
    expect('aaabbbbbbccc'.group_by_character).to eq(["aaa", "bbbbbb", "ccc"])
  end

  it 'can group a sequence of letters that are unsorted' do
    expect('aabbcccca'.group_by_character).to eq(["aaa", "bb", "cccc"])
  end

  it 'can group a sequence of string based integers' do
    expect('14832131'.group_by_character).to eq(["111", "2", "33", "4", "8"])
  end
end

