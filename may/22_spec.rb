require 'rspec'

def hash_fallback(hash:, key_to_lookup:)
end

describe 'hash_fallback' do
  it 'defaults to a different value if the key is not found' do
    players = {
      altuve: 0.350,
      bregman: 0.290,
      gonzalez: 0.309
    }

    expect(hash_fallback(hash: players, key_to_lookup: :altuve)).to eq(0.350)
    expect(hash_fallback(hash: players, key_to_lookup: :oops)).to eq('Player not found')
  end
end
