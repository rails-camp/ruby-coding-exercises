require 'rspec'

def manual_incrementing_matrix(n)
  # x Build an array
  # x Create 'n' number of nested arrays
  # x Each nested array should have 'n' number of elements
  #
  # Keep track of counter value for having a starting point
  # for incrementor

  matrix = Array.new(n) { Array.new(n) }
  # counter = 0
end

manual_incrementing_matrix(4)

describe 'manual_incrementing_matrix' do
  it 'can build a manually incrementing matrix' do
    expected_arr = [
      [0, 1, 2, 3, 4],
      [1, 2, 3, 4, 5],
      [2, 3, 4, 5, 6],
      [3, 4, 5, 6, 7],
      [4, 5, 6, 7, 8],
    ]

    expect(manual_incrementing_matrix(5)).to eq(expected_arr)
  end
end

