require 'rspec'

def subarray_sum arr, sum, starting_index = 0
  accumulator = 0
  subarr = []

  final_array = arr.drop(starting_index).map.with_index(starting_index) do |e, idx|
    accumulator += e
    subarr << idx

    return subarr if accumulator == sum

    if accumulator > sum
      starting_index += 1
      subarray_sum(arr, sum, starting_index)
    end
  end.compact.reject(&:empty?).first

  return 'No subarray found' if final_array == nil
  final_array
end

arr = [1, 4, 0, 0, 3, 10, 5]
subarray_sum(arr, 7)

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
