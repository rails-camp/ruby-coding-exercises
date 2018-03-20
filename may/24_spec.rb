require 'rspec'

describe 'manual_exponent' do
  it 'replicates the exponent behavior' do
    expect(2.to_the_power_of(3)).to eq(8)
    expect(3.to_the_power_of(5)).to eq(243)
    expect(10.to_the_power_of(120)).to eq(1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
  end
end
