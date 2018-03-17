require 'rspec'

def weighted_lottery(weights)
end

weights = {
  winning: 1,
  losing: 1_000
}

weighted_lottery(weights)


describe 'weighted_lottery' do
  it 'gives a proportionate chance of winning in relation to the weights for two weights' do
    weights = {
      winning: 1,
      losing: 1_000
    }

    won = 0
    lost = 0

    1000.times do
      if weighted_lottery(weights) == :losing
        lost += 1
      else
        won += 1
      end
    end

    result = (lost > won)

    expect(result).to be_truthy
  end

  it 'gives a proportionate chance of winning in relation to the weights for any number of weights' do
    weights = {
      winning: 1,
      breaking_even: 100,
      losing: 1_000
    }

    won = 0
    broke_even = 0
    lost = 0

    1000.times do
      result = weighted_lottery(weights)
      if result == :losing
        lost += 1
      elsif result == :breaking_even
        broke_even += 1
      else
        won += 1
      end
    end

    lost_vs_broke_even = (lost > broke_even)
    broke_even_vs_won = (broke_even > won)

    expect(lost_vs_broke_even).to be_truthy
    expect(broke_even_vs_won).to be_truthy
  end
end
