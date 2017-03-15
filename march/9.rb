require 'phone'

# %c - country_code (385)
# %a - area_code (91)
# %A - area_code with leading zero (091)
# %n - number (5125486)
# %f - first @@n1_length characters of number (configured through Phoner::Phone.n1_length), default is 3 (512)
# %l - last characters of number (5486)
# %x - the extension number

def phone_builder number:, area_code:, country_code:, extension:
  Phoner::Phone.new(number: number,
                    area_code: area_code,
                    country_code: country_code,
                    extension: extension)
end

def phone_parser number
  Phoner::Phone.parse number
end

def phone_formatter number
  Phoner::Phone.parse(number).format "(%a) %f-%l"
end

def phone_valid? number
  Phoner::Phone.valid? number
end

describe 'Phone tools' do
  it 'can properly build a phone number' do
    phone = phone_builder(number: '1234567',
                          area_code: '480',
                          country_code: '1',
                          extension: '333')
    expect(phone.area_code).to eq('480')
  end

  it 'can properly parse a phone number' do
    expect(phone_parser('+16021234567').area_code).to eq('602')
  end

  it 'can format a phone number' do
    expect(phone_formatter '+16021234567').to eq('(602) 123-4567')
  end

  it 'can verify if a phone number is valid' do
    expect(phone_valid? '+16021234567').to eq(true)
  end
end

