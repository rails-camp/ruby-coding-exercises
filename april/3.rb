require 'rspec'
require 'date'

describe 'Message tracker' do
  before do
    @user_one = 'Jordan'
    @user_two = 'Tiffany'
    @chat = Chat.new(user_1: @user_one, user_2: @user_two)
  end

  it 'allows messages to be sent between users' do
    @chat.new_message('Hi there', @user_one)
    expect(@chat.new_message('Hi back', @user_two)).to eq(
      {
        :sender=>"Tiffany",
        :message=>"Hi back",
        :timestamp=>Date.today
      })
  end

  it 'can provide a history of messages between users' do
    @chat.new_message('Hi there', @user_one)
    @chat.new_message('Hi back', @user_two)
    expect(@chat.messages).to eq(
      [
        {
          :sender=>"Jordan",
          :message=>"Hi there",
          :timestamp=>Date.today
        },
        {
          :sender=>"Tiffany",
          :message=>"Hi back",
          :timestamp=>Date.today
        }
      ])
  end
end

