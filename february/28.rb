require 'rspec'

describe 'Hashtag generator' do
  it 'takes in a string and converts each word into a hashtag' do
    str = 'fun words that need to be hashtags'
    expect(str.hashtag_generator).to eq('#fun #words #that #need #to #be #hashtags')
  end
end

