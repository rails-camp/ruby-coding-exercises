require 'rspec'

describe 'Fibonacci' do
  it 'properly implements the fibonacci sequence and can generate an array of n values' do
    f = Fibonacci.new(10)
    expect(f.sequence).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144])

    f2 = Fibonacci.new(23)
    expect(f2.sequence).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025])
  end
  it 'properly can give the sum of the fibonacci sequence' do
    f = Fibonacci.new(10)
    expect(f.total).to eq(376)

    f2 = Fibonacci.new(23)
    expect(f2.total).to eq(196417)
  end
end

