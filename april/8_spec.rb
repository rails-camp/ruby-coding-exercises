require 'rspec'

module PhoneParser
  def self.parse(num)
    num.delete!("^0-9")
    digit_length_validator(num)
  end

  def self.digit_length_validator num
    if num.length < 10
      raise PhoneLengthError
    else
      num
    end
  end
end

class PhoneLengthError < StandardError
  def message
    'Phone numbers need to have at least 10 digits'
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
    expect(PhoneParser.parse('555-555-5555')).to eq('5555555555')
    expect(PhoneParser.parse('+15555555555')).to eq('5555555555')
  end
end
