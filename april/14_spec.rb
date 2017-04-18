require 'rspec'

class Integer
  def is_even?
    if (self % 2 == 0) || (self == 0)
      true
    else
      false
    end
  end

  def is_odd?
    if !(self % 2 == 0) && !(self == 0)
      true
    else
      false
    end
  end
end

describe 'New even and odd' do
  it 'is_even? will return true if an even number is passed to it' do
    expect(10.is_even?).to eq(true)
    expect(0.is_even?).to eq(true)
    expect(74834.is_even?).to eq(true)
  end

  it 'is_even? will return false if an odd number is passed to it' do
    expect(1.is_even?).to eq(false)
    expect(101.is_even?).to eq(false)
    expect(74835.is_even?).to eq(false)
  end

  it 'is_odd? will return true if an odd number is passed to it' do
    expect(11.is_odd?).to eq(true)
    expect(77.is_odd?).to eq(true)
    expect(74833.is_odd?).to eq(true)
  end

  it 'is_odd? will return false if an even number is passed to it' do
    expect(0.is_odd?).to eq(false)
    expect(404.is_odd?).to eq(false)
    expect(4838.is_odd?).to eq(false)
  end
end
