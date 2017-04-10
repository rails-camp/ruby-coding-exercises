require 'rspec'

describe 'Find subarray with given sum' do
  it 'finds array index range for a sum of 33' do
    arr = [1, 4, 20, 3, 10, 5]
    expect(subarray_sum(arr, 33)).to eq([2, 3, 4])
  end

  it 'finds array index range for a sum of 7' do
    arr = [1, 4, 0, 0, 3, 10, 5]
    expect(subarray_sum(arr, 7)).to eq([1, 2, 3, 4])
  end

  it 'returns a string when no sub array is found' do
    arr = [1, 4]
    expect(subarray_sum(arr, 0)).to eq('No subarray found')
  end
end

