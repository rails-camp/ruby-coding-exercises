require 'rspec'

def pretty_price(gross_cost:, decimal_extension:)
end

describe '.pretty_price' do
  it 'creates a pretty price for numbers and decimals from whole number extensions' do
    expect(pretty_price(gross_cost: 3, decimal_extension: 95)). to eq(3.95)
    expect(pretty_price(gross_cost: 100.83, decimal_extension: 2)). to eq(100.02)
    expect(pretty_price(gross_cost: 42.25, decimal_extension: 99)). to eq(42.99)
  end

  it 'creates a pretty price for numbers and decimals from float extensions' do
    expect(pretty_price(gross_cost: 3, decimal_extension: 0.95)). to eq(3.95)
    expect(pretty_price(gross_cost: 100.83, decimal_extension: 0.02)). to eq(100.02)
    expect(pretty_price(gross_cost: 42.25, decimal_extension: 0.99)). to eq(42.99)
  end
end
