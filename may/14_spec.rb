require 'rspec'

def formula_generator(names)
  # Implementation goes here
  # Formula should follow pattern:
  # =SOMEFORMULA("FORMULA-PARAM", "user", "a_username")
  # 
  # =SOMEFORMULA("FORMULA-PARAM", "user", "another_username")
  #
  # =SOMEFORMULA("FORMULA-PARAM", "user", "some_other_username")
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

