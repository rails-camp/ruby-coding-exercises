require 'rspec'

# Reference
# https://blog.daftcode.pl/fixing-unicode-for-ruby-developers-60d7f6377388

class String
  def username_cleaner
    upcase.unicode_normalize(:nfkc)
  end
end

describe 'understanding idempotent methods' do
  it 'converts unicode characters and ignores cases to match usernames' do
    supplied_username_one = "myusernᵃme".username_cleaner
    supplied_username_two = "myusername".username_cleaner
    database_username =  "MYUSERNAME"

    expect(supplied_username_one == database_username).to eq(true)
    expect(supplied_username_two == database_username).to eq(true)
  end

  it 'returns false if the usernames do not match' do
    wrong_username = "usernᵃme".username_cleaner
    database_username =  "MYUSERNAME"

    expect(wrong_username == database_username).to eq(false)
  end
end
