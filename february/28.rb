require 'rspec'

class String
  def hashtag_generator
    split.map do |e|
      "##{e}"
    end.join(' ')
  end
end

str = 'fun words that need to be hashtags'
str.hashtag_generator

describe 'Hashtag generator' do
  it 'takes in a string and converts each word into a hashtag' do
    str = 'fun words that need to be hashtags'
    expect(str.hashtag_generator).to eq('#fun #words #that #need #to #be #hashtags')
  end
end
