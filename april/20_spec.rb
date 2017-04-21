require 'rspec'

describe Summer do
  it 'can sum numbers using a for loop' do
    total = Summer.for_sum([1, 4, 11, 42, 12, 21])
    expect(total).to eq(91)
  end

  it 'can sum numbers using a while loop' do
    total = Summer.while_sum([4, 11, 42, 12, 21])
    expect(total).to eq(90)
  end

  it 'can use recursion to sum numbers' do
    total = Summer.recursive_sum([900, 4, 11, 42, 12, 21])
    expect(total).to eq(990)
  end
end

