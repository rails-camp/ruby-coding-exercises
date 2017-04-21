require 'rspec'

Summer = Struct.new(:nums) do
  def self.for_sum(nums)
    total = 0

    for i in nums
      total += i
    end

    total
  end

  def self.while_sum(nums)
    total, i = 0, 0

    while i <= (nums.size - 1)
      total += nums[i]
      i += 1
    end

    total
  end

  def self.recursive_sum(nums, total = 0)
    return total if nums.empty?

    total += nums.pop

    recursive_sum(nums, total)
  end
end

p Summer.while_sum([4, 11, 42, 12, 21])

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
