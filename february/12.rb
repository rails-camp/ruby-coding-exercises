require 'rspec'  # => true

def string_sum nums
  nums.map(&:to_i).inject(&:+)  # => 210, 495550
end                             # => :string_sum

describe 'Summing Strings' do
  it 'sums an array of string based integers' do
    expect(string_sum('1'..'20')).to eq(210)
    expect(string_sum('100'..'1000')).to eq(495550)
  end

  it 'sums an array of integers' do
    expect(string_sum(100..1000)).to eq(495550)
  end
end
