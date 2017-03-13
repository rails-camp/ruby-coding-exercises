require 'rspec'

unchangeable_elements = [1, 2, 3]
unchangeable_elements.freeze

describe 'Immutable array' do
  it 'does not allow an array to be altered' do
    expect{unchangeable_elements << 4}.to raise_error(RuntimeError)
  end
end
