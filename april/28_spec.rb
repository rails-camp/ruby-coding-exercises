require 'rspec'

def string_values(columns)
  columns.each_with_object("") do |column, str|
    return str << "'#{column}'" if column == columns.last
    str << "'#{column}', "
  end
end

describe 'string_values' do
  it 'builds a string from a collection and puts single quotes around each element' do
    arr = %w{my set of words}
    expect(string_values(arr)).to eq("'my', 'set', 'of', 'words'")

    arr2 = %w{another set of words but longer}
    expect(string_values(arr2)).to eq("'another', 'set', 'of', 'words', 'but', 'longer'")
  end
end
