require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ship'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @cruiser1 = Ship.new("Cruiser", 3)
    @submarine1 = Ship.new("Submarine", 2)
    @ships1 = [@cruiser1, @submarine1]
    @board1 = Board.new()
    @player1 = Player.new("Alan Turing", @ships1, @board1)
    @cruiser2 = Ship.new("Cruiser", 3)
    @submarine2 = Ship.new("Submarine", 2)
    @ships2 = [@cruiser2, @submarine2]
    @board2 = Board.new()
    @player2 = Player.new("Watson", @ships2, @board2, true)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_player1
    assert_equal "Alan Turing", @turn.player1.name
    assert_instance_of Player, @turn.player1
  end

  def test_it_has_a_player2
    assert_equal "Watson", @turn.player2.name
    assert_instance_of Player, @turn.player2
  end

  def test_enter_coord_msg
    assert_equal "Enter the coordinate for your shot:", @turn.enter_coord_msg
  end

  def test_not_valid_coord_msg
    assert_equal "Please enter a valid coordinate:", @turn.not_valid_coord_msg
  end

  def test_can_display_empty_boards
    expected = (
      "=============COMPUTER BOARD=============\n" +
      "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n" +
      "==============PLAYER BOARD==============\n" +
      "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
    )

    assert_equal(expected, @turn.display_boards)
  end
end
