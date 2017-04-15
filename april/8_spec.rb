require 'rspec'

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

