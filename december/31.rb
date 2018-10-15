require 'rspec'

# ¥
# £
# $

def currency_converter amount, location
  if location == 'US'
    '$' + amount.to_s + '.00'
  elsif location == 'Japan'
    '¥' + amount.to_s
  elsif location == 'UK'
    '£' + amount.to_s + ',00'
  end
end

describe 'Currency converter' do
  it 'can properly format currency for US, Japan, and UK' do
    expect(currency_converter 5000, 'US').to eq('$5000.00')
    expect(currency_converter 5000, 'Japan').to eq('¥5000')
    expect(currency_converter 5000, 'UK').to eq('£5000,00')
  end
end
