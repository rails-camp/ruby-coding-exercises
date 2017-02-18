require 'rspec'

describe 'Four characters?' do
  it 'checks if an array contains elements that are all at least 4 characters long' do
    arr_one = %w{words that have size requirements}
    arr_two = %w{words that have are not all 4 characters long}
    expect(arr_one.at_least_four_characters?).to eq(true)
    expect(arr_two.at_least_four_characters?).to eq(false)
  end
end

