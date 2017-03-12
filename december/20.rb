require 'rspec'

string_array = [
  "Web IconHTML & CSS100%",
  "Command LineLearn the Command Line100%",
  "Ruby IconRuby50%",
  "Rails IconLearn Ruby on Rails100%",
  "Git IconLearn Git100%",
  "SassLearn Sass20%",
  "JQuery IconjQuery1%",
  "Angular JSLearn AngularJS 1.X100%",
  "Javascript IconLearn JavaScript55%"
]

def string_parser string_array
  new_array = []
  string_array.each do |s|
    new_array << s.scan(/\d+/).last.to_i
  end
  new_array
end

string_parser(string_array)

describe "String Parser" do
  it 'can take a string and output the correct values' do
    expect(string_parser(string_array)).to eq([100, 100, 50, 100, 100, 20, 1, 100, 55])
  end
end
