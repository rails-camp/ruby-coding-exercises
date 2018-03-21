require 'rspec'

class ArrayHelper
  def initialize(arr)
    @arr = arr
    @at_beginning = true
  end

  def pop
    if @at_beginning
      @at_beginning = false
      @arr.shift
    else
      @at_beginning = true
      @arr.pop
    end
  end
end

describe 'front_and_back_popper' do
  it 'alternates popping elements from the front and back of an array' do
    arr = [1, 2, 3, 4, 5]
    front_and_back_popper = ArrayHelper.new(arr)
    expect(front_and_back_popper.pop).to eq(1)
    expect(front_and_back_popper.pop).to eq(5)
    expect(front_and_back_popper.pop).to eq(2)
    expect(front_and_back_popper.pop).to eq(4)
    expect(front_and_back_popper.pop).to eq(3)
    expect(front_and_back_popper.pop).to eq(nil)
  end
end

