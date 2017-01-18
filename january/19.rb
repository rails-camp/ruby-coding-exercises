require 'rspec'

describe 'Include? clone' do
  it 'returns true if a supplied element is included in an array' do
    arr = [2, 5, 100, 4]
    expect(arr.does_it_have? 5).to eq(true)
    expect(arr.does_it_have? 20).to eq(false)
  end
end

