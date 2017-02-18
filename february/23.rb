require 'rspec'

def mod_checker arr, num1, num2
end

describe 'Mod checker' do
  it 'returns the first value divisible by 12 and 16' do
    expect(mod_checker(1..200, 12, 16)).to eq([48, 96, 144, 192])
    expect(mod_checker(1..120000, 200, 73)).to eq([14600, 29200, 43800, 58400, 73000, 87600, 102200, 116800])
  end
end

