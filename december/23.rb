require 'rspec'

def random_numbers
  array = []
  20.times do
    r = rand 0..999
    array << r
  end
  array
end

#shorter answer:
# def random_numbers
#   Array.new(20) { rand 1000 }
# end

describe 'Random number collection generator' do
  it 'creates a collection of random numbers ranging from 0 to 999' do
    # Not a perfect test since there is a slight chance for duplicate
    # Arrays to be created
    random_set_one = random_numbers
    random_set_two = random_numbers
    expect(random_numbers.count).to eq(20)
    expect(random_set_one).to_not eq(random_set_two)
  end
end
