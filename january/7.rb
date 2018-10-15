require 'rspec'
# https://www.youtube.com/watch?v=LzbYNN48JZg
menu = {
  'appetizers': ['Chips', 'Quesadillas', 'Flatbread'],
  'entrees': ['Steak', 'Chicken', 'Lobster'],
  'desserts': ['Cheesecake', 'Cake', 'Cupcake']
}

def daily_special hash
  array = []
  hash.map { |category| array << category.last }.flatten.sample
end

describe 'Nested hash element selector' do
  it 'selected a random element from the set of nested arrays' do
    expect(daily_special(menu).class).to eq(String)
  end
end

