require 'rspec'

def cloned_cycle collection, num
  final_items = []

  num.times do
    collection.each do |x|
      final_items << x
    end
  end

  final_items
end

describe 'Cloned cycle' do
  it 'Iterates through an array a variable number of times and returns the full set of elements' do
    arr = (1..3)
    expect(cloned_cycle(arr, 3)).to eq([1, 2, 3, 1, 2, 3, 1, 2, 3])
  end
end
