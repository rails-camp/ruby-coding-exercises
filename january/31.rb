require 'rspec'
require 'date'

def months
  ((Date.new(2017, 01))..(Date.new(2017, 12))).each_with_object([]) do |date, month_array|
    month_array << date.strftime("%B")
  end.uniq
end

def smarter_months
  Date::MONTHNAMES[1..12]
end

describe 'Month generator' do
  it 'returns the full list of months for a year as an array' do
    expect(months).to eq(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"])
  end
end
