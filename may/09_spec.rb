require 'rspec'

describe 'Hash sum' do
  it 'returns the sum of a hash where the values contain numbers' do
    invoices = {
      google: 100.0,
      yahoo: 105.22,
      twitter: 42.50
    }

    expect(hash_sum(invoices)).to eq(247.72)
  end

  it 'returns 0 for an empty hash' do
    empty_hash = {}
    expect(hash_sum(empty_hash)).to eq(0)
  end
end
