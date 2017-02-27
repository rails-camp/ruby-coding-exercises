require 'rspec'

describe 'Lockpick' do
  it 'tells you how many guesses it could take to guess the combination when given three numbers' do
    values = [14, 9, 29]
    expect(lockpick values). to eq(6)
  end

  it 'tells you how many guesses it could take to guess the combination when given any count of numbers' do
    values = [14, 9, 29, 44, 2, 33]
    expect(lockpick values). to eq(120)
  end

  it 'tells you the potential combinations if combinations is marked true' do
    values = [14, 9, 29]
    expect(lockpick values, combinations: true). to eq([[14, 9, 29], [14, 29, 9], [9, 14, 29], [9, 29, 14], [29, 14, 9], [29, 9, 14]])
  end
end

