require 'rspec'
require 'humanize'

class String
  def friendly_counter
    empty_array_hash = Hash.new { |k, v| k[v] = [] }
    grouped_hash = split(//).each_with_object(empty_array_hash) do |e, hash|
      hash[e] << e
    end

    grouped_hash.map do |k, v|
      v.count.humanize + ' ' + pluralize(v.count, k)
    end.join(', ')
  end

  def pluralize(count, str)
    if count == 0 || count > 1
      str + "'s"
    else
      str
    end
  end
end

describe 'group_by_character' do
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
