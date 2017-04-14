require 'rspec'
require_relative '../support/country_codes'

module PhoneParser
  include CountryCodes

  def self.parse(number)
    number.delete!("^0-9")
    digit_length_validator(number)
    country_code_validator(number)
  end

  def self.digit_length_validator number
    number.length < 10 ? (raise PhoneLengthError) : (number)
  end

  def self.country_code_validator number
    if number.length == 10
      number
    else
      extracted_number = number[-10..-1]
      country_code = number.gsub(extracted_number, '')

      country_codes.include?(country_code) ? (number) : (raise CountryCodeError)
    end
  end

  def self.country_codes
    CountryCodes.code_array.flatten.keep_if { |e| e =~ /\d+/ }
  end
end

class PhoneLengthError < StandardError
  def message
    'Phone numbers need to have at least 10 digits'
  end
end

class CountryCodeError < StandardError
  def message
    'Country code not recognized'
  end
end

describe PhoneParser do
  it 'can parse any US based phone number in various formats' do
    expect(PhoneParser.parse('555-555-5555')).to eq('5555555555')
    expect(PhoneParser.parse('5555555555')).to eq('5555555555')
    expect(PhoneParser.parse('(555) 555-5555')).to eq('5555555555')
    expect(PhoneParser.parse('555.555.5555')).to eq('5555555555')
    expect(PhoneParser.parse('555 555.5555')).to eq('5555555555')
    expect(PhoneParser.parse('555 555.5555')).to eq('5555555555')
  end

  it 'informs the client if there are too few or too many digits' do
    expect{ PhoneParser.parse('5555555') }.to raise_error(PhoneLengthError)
    expect{ PhoneParser.parse('') }.to raise_error(PhoneLengthError)
  end

  it 'allows a valid country code to be supplied' do
    expect(PhoneParser.parse('+15555555555')).to eq('15555555555')
    expect(PhoneParser.parse('1-7845555555555')).to eq('17845555555555')
    expect(PhoneParser.parse('Country Code: 379, Phone:  555-555-5555')).to eq('3795555555555')
  end

  it 'raises an error if an invalid country code is supplied' do
    expect{ PhoneParser.parse('999 555 555 5555') }.to raise_error(CountryCodeError)
  end
end
