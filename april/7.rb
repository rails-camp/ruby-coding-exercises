require 'rspec'

describe 'file_tail' do
  it 'can retrieve the last 5 lines from a file and store it in an array' do
    expect(file_tail('support/emails.txt', 5)).to eq([
      "Satisfied with Smile Dental? Review us on Yelp!",
      "How was your service at ZenSpa?",
      "Thanks for visiting! Here’s a link to submit your review",
      "Please share your experience with us!",
      "Let’s be friends—Like and Review us on Facebook!"
    ])
  end
end

