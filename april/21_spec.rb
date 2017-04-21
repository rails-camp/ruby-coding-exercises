require 'rspec'

def collection_alternator arr1, arr2
  merged_arrays = arr1 + arr2
  merged_arrays.each_with_object([]).with_index do |(_, arr), idx|
    if idx.even?
      arr << arr1.shift
    else
      arr << arr2.shift
    end
  end
end

describe 'collection_alternator' do
  it 'returns a new collection, combining and alternating the elements of two collections' do
    arr1 = ['a', 'b', 'c']
    arr2 = [1, 2, 3]
    expect(collection_alternator(arr1, arr2)).to eq(['a', 1, 'b', 2, 'c', 3])
  end
end
