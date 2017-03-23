require 'rspec'

describe 'dice_validator' do
  it 'returns true if the dice are valid' do
    expect(valid_dice? 4, 2).to eq(true)
    expect(valid_dice? 6, 6).to eq(true)
    expect(valid_dice? 5, 1).to eq(true)
  end

  it 'returns false if the dice are valid' do
    expect(valid_dice? 8, 2).to eq(false)
    expect(valid_dice? 1, 7).to eq(false)
    expect(valid_dice? 9, 7).to eq(false)
  end
end
