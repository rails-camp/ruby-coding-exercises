require 'rspec'

class Completion
  def initialize(number_of_guides:, total_completed:)
    @number_of_guides = number_of_guides
    @total_completed = total_completed
  end

  def completed_percentage
     @total_completed.to_f / @number_of_guides.to_f
  end

  def mark_complete
    @total_completed += 1
  end
end

describe 'Course tracker' do
  it 'tracks course progress' do
    c = Completion.new(number_of_guides: 100, total_completed: 55)
    expect(c.completed_percentage).to eq(0.55)

    c.mark_complete

    expect(c.completed_percentage).to eq(0.56)
  end
end
