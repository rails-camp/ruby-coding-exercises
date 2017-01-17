require 'rspec'

def title_builder headers, data
  hash = Hash.new

  headers.each_with_index do |header, index|
    hash[header] = data[index]
  end

  hash
end

describe 'Hash builder' do
  it 'combines two arrays to generate a hash' do
    arr_1 = ['title', 'description', 'rating']
    arr_2 = ['Fountainhead', 'Novel about unique perspectives', 5]
    expect(title_builder arr_1, arr_2).to eq({"title"=>"Fountainhead", 
                                              "description"=>"Novel about unique perspectives",
                                              "rating"=>5})
  end
end
