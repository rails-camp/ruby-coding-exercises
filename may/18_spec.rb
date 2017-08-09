require 'rspec'
require 'date'

def hash_date_counter_converter(date_hash)
end

describe 'hash_date_counter_converter' do
  it 'converts a hash of dates with count values into an array of epoch timestamps with date multipled by its respective value' do
    date_hash = {
      (Date.new(2015, 10, 1)) => 2,
      (Date.new(2017, 07, 30)) => 1,
      (Date.new(2016, 03, 5)) => 1,
    }

    expect(hash_date_counter_converter(date_hash)).to eq(
      [1443657600, 1443657600, 1501372800, 1457136000]
    )
  end
end

