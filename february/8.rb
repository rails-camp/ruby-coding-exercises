require 'rspec'

class Array
  def remove_duplicates
    self.each_with_object([]) do |e, arr|
      arr << e unless arr.include?(e)
    end
  end
end

describe 'Duplicate removal' do
  it 'Removed duplicates from an array' do
    arr = [1, 3, 4, 1, 4]
    expect(arr.remove_duplicates).to eq([1, 3, 4])
  end
end
