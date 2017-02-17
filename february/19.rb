require 'rspec'

describe 'Fibbonacci' do
  it 'properly calculates the fibonacci value' do
    expect(nth_fibonacci 10).to eq(89)
  end
end

