require 'rspec'

def fraction_calculator fraction_one, fraction_two
end

describe 'Fraction multiplication' do
  it 'can multiply two fractions and output the value in a string based fraction format' do
    expect(fraction_calculator("1/3", "2/4")).to eq("1/6")
  end
end

