require 'rspec'
require 'awesome_print'
require 'pry'

class Battleship
  def initialize(name:)
    @name = name
    current_board = Board.new
  end

  def current_board
  end
end

class Board
  attr_reader :board

  def initialize
    @board = empty_board
    @ships = ships
  end

  def populate_board
    @ships.each do |ship|
      range_generator(ship)
    end
  end

  def range_generator(ship)
    @ship = ship.flatten

    starter_key = @board.keys.shuffle.find do |key|
      @board[key] == []
    end

    starter_letter = starter_key.split(//).first
    starter_number_as_int = starter_key.scan(/\d+/).first.to_i

    if @ship.last == 'horizontal'
      final_letter = alphabet_index[alphabet_index.index(starter_letter) + @ship[1] - 1]

      if final_letter == nil
        range_generator(@ship)
      end

      (starter_letter..final_letter).each do |letter|
        @board[letter + starter_number_as_int.to_s] = @ship.first
      end
    else
      final_number = starter_number_as_int + @ship[1] - 1

      if final_number > 10
        range_generator(@ship)
      end

      (starter_number_as_int..final_number).each do |number|
        @board[starter_letter + number.to_s] = @ship.first
      end
    end
  end

  def spot_taken?
  end

  def alphabet_index
    ('a'..'j').to_a
  end

  def empty_board
    grid.each_with_object(Hash.new) do |node, hash|
      hash[node] = []
    end
  end

  def grid
    ('1'..'10').map do |number|
      ('a'..'j').map { |letter| letter += number }
    end.flatten
  end

  def ships
    {
      'carrier':    [5, direction],
      'battleship': [4, direction],
      'cruiser':    [3, direction],
      'submarine':  [3, direction],
      'destroyer':  [2, direction],
    }
  end

  def direction
    %w{horizontal vertical}.sample
  end
end

b = Board.new
b.populate_board
ap b.board

describe Battleship do
  it 'can build a board' do
    expect(b.current_board).to eq(board)
  end

  it 'allows a user to guess a location on the board' do

  end

  it 'recognizes hits' do

  end

  it 'recognizes misses' do

  end
end
