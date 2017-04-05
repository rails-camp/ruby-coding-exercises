require 'rspec'

describe RPS do
  ## Note: Seeding the randomizer so the computer will always pick paper for testing

  it 'paper beats rock' do
    rps = RPS.new(guess: 'rock')
    rps.rand_seed = 1
    expect(rps.winner_is).to eq('Computer wins')
  end

  it 'paper loses to scissors' do
    rps = RPS.new(guess: 'Scissors')
    rps.rand_seed = 1
    expect(rps.winner_is).to eq('You win!')
  end

  it 'paper ties with paper' do
    rps = RPS.new(guess: 'paper')
    rps.rand_seed = 1
    expect(rps.winner_is).to eq('Tie')
  end
end
