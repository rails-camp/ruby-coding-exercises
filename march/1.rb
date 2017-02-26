require 'rspec'

describe 'ATM' do
  it 'dispenses the correct denominations to users' do
    expect(atm 110, [100, 20, 10, 5]). to eq({100=>1, 20=>0, 10=>1, 5=>0})
    expect(atm 245, [20, 10, 5]). to eq({20=>12, 10=>0, 5=>1})
  end
end

