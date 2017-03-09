require 'rspec'

describe 'Date parser' do
  it 'converts a string formatted as mm/dd/yyyy into a date object' do
    str_date = "07/31/2018"
    expect(date_parser(str_date).class).to eq(Date)
    expect(date_parser(str_date).month).to eq(7)
    expect(date_parser(str_date).leap?).to eq(false)
  end
end

