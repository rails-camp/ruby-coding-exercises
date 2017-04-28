require 'rspec'

class PercentFormatter
  def initialize(float_to_convert)
    raise NotAFloatError unless float_to_convert.is_a?(Float)
    @float_to_convert = float_to_convert
  end

  def convert_to_percent
    @float_to_convert * 100
  end

  def to_s
    "#{convert_to_percent}%"
  end
end

class NotAFloatError < StandardError
  def message;'A float is required'end
end

describe PercentFormatter do
  it 'allows a float to be passed to the class when instantiated' do
    expect{ PercentFormatter.new(0.50) }.to_not raise_error
  end

  it 'raises an error if a float is not provided' do
    expect{ PercentFormatter.new(5) }.to raise_error(NotAFloatError)
  end

  it 'will convert a raw decimal value to a percent' do
    pf = PercentFormatter.new(0.10)
    expect(pf.convert_to_percent).to eq(10.0)
  end

  it 'will return a string with a percent sign of the converted percent' do
    pf = PercentFormatter.new(0.10)
    expect(pf.to_s).to eq('10.0%')
  end
end
