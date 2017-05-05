require 'rspec'

describe 'new_map' do
  it 'can alter and return values in a collection for the Array class' do
    arr = ['1', '2', '3']
    expect(arr.new_map(&:to_i)).to eq([1, 2, 3])
    arr = (1..3).to_a

    returned_value = arr.new_map do |e|
      e += 1
    end

    expect(returned_value).to eq([2, 3, 4])
  end
end

