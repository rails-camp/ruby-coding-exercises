require 'rspec'
require 'pp'

def country_file_parser path
  lines = File.read(path).split("\n")
  lines.each_with_object([]) do |line, arr|
    line_array = line.split
    country_code = line.scan(/\d+/).first
    abbreviation_index = line_array.index(country_code) + 1

    arr << Array.new([country_code, line_array[abbreviation_index]])
  end
end

pp country_file_parser 'support/countries.txt'

describe 'country_file_parser' do
  it 'can pull out the country code and first abbreviation from a raw text file of country information' do
    expect(country_file_parser('support/countries.txt').first).to eq(['93', 'AF'])
    expect(country_file_parser('support/countries.txt').last).to eq(['263', 'ZW'])
  end
end
