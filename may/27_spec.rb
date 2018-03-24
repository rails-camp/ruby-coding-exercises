require 'rspec'

def manual_sum(arr)
end

describe 'manual_sum' do
  it 'returns the sum of an array' do
    expect(manual_sum([1, 2, 3])).to eq(6)
    expect(manual_sum([])).to eq(0)
  end
end
