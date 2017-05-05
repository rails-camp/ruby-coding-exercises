require 'rspec'

describe 'new_each' do
  it 'replicates the functionality of the each method and adds it to the Array class' do
    starting_arr = (1..3).to_a
    ending_arr = []

    starting_arr.new_each do |e|
      ending_arr << e
    end

    expect(ending_arr).to eq([1, 2, 3])
  end
end

