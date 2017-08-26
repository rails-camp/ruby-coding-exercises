require 'rspec'

def first_repeated_element(arr)
end

describe 'first_repeated_element' do
  it 'returns the first repeated element from an array' do
    arr_one = [5, 3, 4, 5, 3, 1]
    expect(first_repeated_element(arr_one)).to eq(5)

    arr_two = [3, 5, 3, 4, 5, 3, 1]
    expect(first_repeated_element(arr_two)).to eq(3)
  end
end
