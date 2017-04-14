require 'rspec'

describe 'country_file_parser' do
  it 'can pull out the country code and first abbreviation from a raw text file of country information' do
    expect(country_file_parser('support/countries.txt').first).to eq(['93', 'AF'])
    expect(country_file_parser('support/countries.txt').last).to eq(['263', 'ZW'])
  end
end

