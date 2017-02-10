require 'rspec'

def num_counter nums
  nums.inject(Hash.new(0)) do |hash, e|
    hash[e] += 1
    hash
  end
end

describe 'Number counter' do
  it 'returns a hash that contains the number of occurrences for each array element' do
    arr = [1, 4, 1, 3, 2, 1, 4, 5, 4, 4, 5, 4]
    expect(num_counter(arr)).to eq(
                                    {
                                      1=>3,
                                      4=>5,
                                      3=>1,
                                      2=>1,
                                      5=>2
                                    }
                                  )
  end
end
