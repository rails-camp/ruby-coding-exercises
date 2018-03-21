require 'rspec'

class ArrayHelper
end

describe 'front_and_back_popper' do
  it 'alternates popping elements from the front and back of an array' do
    arr = [1, 2, 3, 4, 5]
    ah = ArrayHelper.new(arr)

    expect(ah.toggle_pop).to eq(1)
    expect(ah.toggle_pop).to eq(5)
    expect(ah.toggle_pop).to eq(2)
    expect(ah.toggle_pop).to eq(4)
    expect(ah.toggle_pop).to eq(3)
    expect(ah.toggle_pop).to eq(nil)
  end
end


