require 'rspec'

def formula_generator(names)
  formulas = names[0...-1].each_with_object("") do |name, str|
    str << "=SOMEFORMULA(\"FORMULA-PARAM\", \"user\", \"#{name}\")\n\n"
  end

  formulas << "=SOMEFORMULA(\"FORMULA-PARAM\", \"user\", \"#{names.last}\")\n"
end

describe 'excel formula generator' do
  it 'can repeat an excel formula given an array' do
    names = [
      'kristine',
      'tiffany',
      'jon'
    ]

    formulas = <<~EOL
      =SOMEFORMULA("FORMULA-PARAM", "user", "kristine")

      =SOMEFORMULA("FORMULA-PARAM", "user", "tiffany")

      =SOMEFORMULA("FORMULA-PARAM", "user", "jon")
    EOL

    expect(formula_generator(names)).to eq(formulas)
  end
end
