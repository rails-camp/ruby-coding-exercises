require 'rspec'

def get_average(arr)
end


describe 'get_average' do
  it 'returns the average from a list of integers' do
    expect(get_average([1, 2, 3, 4, 5, 6])).to eq(3.5)
  end
end
