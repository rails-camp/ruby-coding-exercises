require 'rspec'
require 'date'

years = (1900..1999).to_a
leap_years = []

years.each do |year|
  current_year = Date.new(year)
  leap_years << year if current_year.leap?
end

describe 'Leap year calculation' do
  it 'properly renders the leap years for the 20th century' do
    expect(leap_years).to eq([1904, 1908, 1912, 1916, 1920, 1924, 1928, 1932, 1936, 1940, 1944, 1948, 1952, 1956, 1960, 1964, 1968, 1972, 1976, 1980, 1984, 1988, 1992, 1996])
  end
end

