require 'rspec'

module ArrayHelper
  def self.manual_min(arr)
  end

  def self.manual_max(arr)
  end
end

describe 'ArrayHelper' do
  describe '.manual_min' do
    it 'returns the smallest number in an array' do
      arr = [34, 1, 3, 100, 3]
      expect(ArrayHelper.manual_min(arr)).to eq(1)

      arr = [34, 1, 0, 100, 3]
      expect(ArrayHelper.manual_min(arr)).to eq(0)
    end
  end

  describe '.manual_max' do
    it 'returns the smallest number in an array' do
      arr = [34, 1, 3, 100, 3]
      expect(ArrayHelper.manual_max(arr)).to eq(100)

      arr = [34, 1, 0, 100, 3, 500]
      expect(ArrayHelper.manual_max(arr)).to eq(500)
    end
  end
end

