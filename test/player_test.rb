require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/player'
require './lib/ship'

class PlayerTest < Minitest::Test
  def setup
    @board1 = Board.new()
    @cruiser1 = Ship.new("Cruiser", 3)
    @submarine1 = Ship.new("Submarine", 2)
    @ships1 = [@cruiser1, @submarine1]
    @player1 = Player.new("Ada Lovelace", @ships1, @board1)

    @board2 = Board.new()
    @cruiser2 = Ship.new("Cruiser", 3)
    @submarine2 = Ship.new("Submarine", 2)
    @ships2 = [@cruiser2, @submarine2]
    @player2 = Player.new("Watson", @ships2, @board2, true)
  end

  def test_it_exists
    assert_instance_of Player, @player1
    assert_instance_of Player, @player2
  end

  def test_it_has_a_name
    assert_equal "Ada Lovelace", @player1.name
    assert_equal "Watson", @player2.name
  end

  def test_it_has_ships
    assert_equal @ships1, @player1.ships
    assert_equal @ships2, @player2.ships
  end

  def test_it_has_a_board
    assert_instance_of Board, @player1.board
    assert_instance_of Board, @player2.board
  end

  def test_it_knows_if_it_is_a_computer
    assert_equal false, @player1.is_computer
    assert @player2.is_computer
  end

  def test_it_knows_if_it_lost
    assert_equal false, @player1.has_lost?

    @cruiser1.hit
    @cruiser1.hit
    @cruiser1.hit

    assert_equal false, @player1.has_lost?

    @submarine1.hit
    @submarine1.hit
    @submarine1.hit

    assert @player1.has_lost?
  end
end
