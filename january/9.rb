require 'rspec'

def fraction_calculator fraction_one, fraction_two, operator
  num_one = Rational(fraction_one)
  num_two = Rational(fraction_two)

  final_result = case operator
  when '/' then num_one / num_two
  when '*' then num_one * num_two
  when '+' then num_one + num_two
  when '-' then num_one - num_two
  end

  String(final_result)
end

describe 'Fraction multiplication' do
  it 'can multiply two fractions and output the value in a string based fraction format' do
    expect(fraction_calculator("1/3", "2/4", "*")).to eq("1/6")
    expect(fraction_calculator("1/3", "2/4", "/")).to eq("2/3")
    expect(fraction_calculator("1/3", "2/4", "+")).to eq("5/6")
    expect(fraction_calculator("1/3", "2/4", "-")).to eq("-1/6")
  end
end

