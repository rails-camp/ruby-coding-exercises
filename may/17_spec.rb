require 'rspec'

def hash_sum(*hashes)
end

describe 'hash_sum' do
  it 'totals the values for a hash instead of overriding' do
    hash_one = { "Sun, 14 May 2017" => 1 }
    hash_two   = { "Wed, 10 May 2017" => 1, "Thu, 11 May 2017" => 0, "Fri, 12 May 2017" => 0, "Sat, 13 May 2017" => 10, "Sun, 14 May 2017" => 0 }
    hash_three   = { "Thu, 11 May 2017" => 2, "Fri, 12 May 2017" => 0, "Sat, 13 May 2017" => 4, "Sun, 14 May 2017" => 0 }
    hash_four = { "Fri, 12 May 2017" => 1, "Sat, 13 May 2017" => 1, "Sun, 14 May 2017" => 0 }

    expect(hash_sum(hash_one, hash_two, hash_three, hash_four)).to eq(
      { "Sun, 14 May 2017" => 1, "Wed, 10 May 2017" => 1, "Thu, 11 May 2017" => 2, "Fri, 12 May 2017" => 1, "Sat, 13 May 2017" => 15 }
    )
  end

  it 'skips over an empty hash' do
    hash_one = { "Sun, 14 May 2017" => 1 }
    hash_two   = { "Wed, 10 May 2017" => 1, "Thu, 11 May 2017" => 0, "Fri, 12 May 2017" => 0, "Sat, 13 May 2017" => 10, "Sun, 14 May 2017" => 0 }
    hash_three   = { "Thu, 11 May 2017" => 2, "Fri, 12 May 2017" => 0, "Sat, 13 May 2017" => 4, "Sun, 14 May 2017" => 0 }
    hash_four = {}

    expect(hash_sum(hash_one, hash_two, hash_three, hash_four)).to eq(
      { "Sun, 14 May 2017" => 1, "Wed, 10 May 2017" => 1, "Thu, 11 May 2017" => 2, "Fri, 12 May 2017" => 0, "Sat, 13 May 2017" => 14 }
    )
  end
end

