require 'rspec'

def fraction_calculator fraction_one, fraction_two
  String(
    Rational(numerator(fraction_one), denominator(fraction_one)) *
    Rational(numerator(fraction_two), denominator(fraction_two))
  )
end

def numerator fraction
  fraction.split('/').first
end

def denominator fraction
  fraction.split('/').last
end

fraction_calculator('1/3', '2/4')

describe 'Fraction multiplication' do
  it 'can multiply two fractions and output the value in a string based fraction format' do
    expect(fraction_calculator("1/3", "2/4")).to eq("1/6")
  end
end
