require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/game"

class GameTest < Minitest::Test
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
    @player2 = Player.new("Watson", @ships2, @board1, true)

    @game = Game.new(@player1, @board1, @player2, @board2)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  #can't test_it_prints_out_main_menu
  #can't test_get_user_input

  def test_it_has_players
    assert_instance_of Player, @game.player1
    assert_equal @player1, @game.player1
    assert_instance_of Player, @game.player2
    assert_equal @player2, @game.player2
  end

  # TODO: I don't think we need to test that it CAN place ships
  # that's a board method and was tested there but we should somethow
  # test that it places ships randonly
  def test_it_can_randomly_place_computer_ships_on_the_board
  end
end