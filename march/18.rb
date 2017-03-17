require 'rspec'

def string_infinity_generator num
  arr = []

  (1..Float::INFINITY).each do |i|
    arr << i.to_s
    break if i == num
  end

  arr
end

describe 'Infinity string generator' do
  it 'an array of string based integers from 1 to 10 when 10 is the method argument' do
    expect(string_infinity_generator 10).to eq(["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
  end

  it 'an array of string based integers from 1 to 5 when 5 is the method argument' do
    expect(string_infinity_generator 5).to eq(["1", "2", "3", "4", "5"])
  end
end
