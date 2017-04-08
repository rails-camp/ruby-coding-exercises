require 'rspec'

class Array
  def triplet_sum_zero
    combination(3).to_a.keep_if do |c|
      c.inject(&:+) == 0
    end
  end
end

describe 'Triplet sum zero' do
  it 'returns arrays of all combinations of triplets that sum equals 0' do
    arr_one = [0, -1, 2, -3, 1]
    arr_two = [1, -2, 1, 0, 5]

    expect(arr_one.triplet_sum_zero).to eq([[0, -1, 1], [2, -3, 1]])
    expect(arr_two.triplet_sum_zero).to eq([[1, -2, 1]])
  end
end
