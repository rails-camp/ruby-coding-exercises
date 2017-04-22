require 'rspec'

describe 'largest_number_combination' do
  it 'combines numbers to be the largest possible number' do
    arr = [50, 2, 1, 9]
    expect(largest_number_combination(arr)).to eq(95021)
  end
end

