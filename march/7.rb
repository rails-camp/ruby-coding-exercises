require 'rspec'

describe 'Course tracker' do
  it 'tracks course progress' do
    c = Completion.new(number_of_guides: 100, total_completed: 55)
    expect(c.completed_percentage).to eq(0.55)

    c.mark_complete

    expect(c.completed_percentage).to eq(0.56)
  end
end

