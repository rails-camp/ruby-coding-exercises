require 'rspec'

def big_data_parser num
  (1..num).map do |i|
    i ** 2
  end.first(5)
end

describe 'Big Data' do
  it 'can take a large value as an input and not timeout' do
    expect(big_data_parser 1_000_000_000_000_000_000). to eq([1, 4, 9, 16, 25])
  end
end

