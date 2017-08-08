require 'rspec'
require 'date'

def count_by_day(arr)
end

describe 'count_by_day' do
  before do
    Struct.new("Guide", :title, :created_at)
    guide_one   = Struct::Guide.new("Post One", Date.today.to_s)
    guide_two   = Struct::Guide.new("Post Two", (Date.today - 1).to_s)
    guide_three = Struct::Guide.new("Post Three", (Date.today - 2).to_s)
    guide_four  = Struct::Guide.new("Post Four", (Date.today - 2).to_s)

    @guides = [
      guide_one,
      guide_two,
      guide_three,
      guide_four,
    ]
  end

  it 'counts the number of posts per day and returns an array of the counts' do
    expect(count_by_day(@guides)).to eq([1, 1, 2])
  end
end

