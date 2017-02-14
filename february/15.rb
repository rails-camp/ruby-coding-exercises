require 'rspec'

describe 'Prime Sum' do
  it 'sums the sequence of prime numbers' do
    expect(prime_sum 22).to eq(77)
    expect(prime_sum 42).to eq(238)
  end
end
