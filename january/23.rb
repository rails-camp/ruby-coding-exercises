require 'rspec'

describe 'Block User' do
  it 'Allows a user to be created with a block of values' do
    user = User.new do |u|
      u.name = "Jordan"
      u.email = "test@test.com"
    end

    expect(user.name).to eq('Jordan')
    expect(user.email).to eq('test@test.com')
  end

  it 'Allows a user to be created witout default values' do
    user = User.new
    user.name = "Jordan"
    user.email = "test@test.com"

    expect(user.name).to eq('Jordan')
    expect(user.email).to eq('test@test.com')
  end
end

