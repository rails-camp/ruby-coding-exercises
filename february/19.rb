require 'rspec'

def nth_fibonacci num
  (1..num).inject( [0, 1] ) { | fib | fib << fib.last(2).inject(:+) }.last
end

describe 'Fibbonacci' do
  it 'properly calculates the fibonacci value' do
    expect(nth_fibonacci 10).to eq(89)
  end
end

