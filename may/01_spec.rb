require 'rspec'

describe 'during_this_day?' do
  before do
    @beginning_of_day = Time.new(2017, 7, 31, 0, 0, 0)
    @end_of_day = Time.new(2017, 7, 31, 23, 59, 59)
  end

  it 'returns true if passed a time object within a given range of time objects' do
    in_day = Time.new(2017, 7, 31, 9, 59, 59)
    expect(
      during_this_day?(@beginning_of_day, @end_of_day, in_day)
    ).to eq(true)
  end

  it 'returns false if passed a time object outside a given range of time objects' do
    not_in_day = Time.new(2017, 9, 31, 9, 59, 59)
    expect(
      during_this_day?(@beginning_of_day, @end_of_day, not_in_day)
    ).to eq(false)
  end
end
