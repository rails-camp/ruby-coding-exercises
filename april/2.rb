require 'rspec'

def subarray_sum arr, sum
  if arr.size == 1 && arr.first == sum
    return [0]
  end

  i = 0
  j = 1
  current_sum = arr[i]

  while j < arr.length
    current_sum += arr[j]
    j += 1

    while current_sum > sum && i < j-1
      current_sum -= arr[i]
      i += 1
    end

    if current_sum == sum
      return (i...j).to_a
    end
  end

  'No subarray found'
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
