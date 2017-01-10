require 'rspec'

def pseudo_random num
end

describe 'Psudeo random number generator' do
  it 'creates the same sequence of random numbers' do
    random_sequence = pseudo_random 3
    expect(random_sequence.resume).to eq(37)
    expect(random_sequence.resume).to eq(12)
    expect(random_sequence.resume).to eq(72)
  end
end
