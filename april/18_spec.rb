require 'rspec'

class CardDeck
  attr_reader :deck
  attr_writer :seed

  def initialize
    @deck = build_deck
  end

  def build_deck
    suits = %w{spades hearts clubs diamonds}
    values = ('2'..'10').to_a + %w{Jack Queen King Ace}

    suits.each_with_object([]) do |suit, arr|
      values.each do |v|
        arr << "#{v} of #{suit}"
      end
    end
  end

  def shuffle_deck
    srand(@seed || 928734)
    @deck.shuffle
  end
end

describe CardDeck do
  it 'can create a deck of cards' do
    cd = CardDeck.new.deck
    expect(cd.last).to eq('Ace of diamonds')
  end

  it 'can accept a custom seed for the randomization algorithm' do
    cd = CardDeck.new
    expect { cd.seed = 1 }.to_not raise_error
  end

  it 'can shuffle the deck' do
    cd = CardDeck.new
    cd.seed = 1
    expect(cd.shuffle_deck.first).to eq('7 of clubs')
    expect(cd.shuffle_deck[42]).to eq('5 of hearts')
  end
end
