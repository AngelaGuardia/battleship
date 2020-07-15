require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/messages"
require "./lib/game"

class GameTest < Minitest::Test
  def setup
    @game = Game.new
    @game.stubs(:custom_board_dimension_message)
    @game.stubs(:set_dimension).returns(4)
    @game.create_boards
    @game.create_ships
    @game.create_players
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_can_create_boards
    assert_instance_of Board, @game.board1
    assert_instance_of Board, @game.board2
  end

  def test_it_can_create_ships
    assert_instance_of Ship, @game.ships1[0]
    assert_instance_of Ship, @game.ships1[1]
    assert_instance_of Ship, @game.ships2[0]
    assert_instance_of Ship, @game.ships2[1]
  end

  def test_it_can_create_players
    assert_instance_of Player, @game.players[0]
    assert_instance_of Player, @game.players[1]
  end

  def test_it_can_generate_random_valid_coordinates
    coordinates1 = @game.random_coordinates(@game.players[0], @game.ships1[0].length)
    coordinates2 = @game.random_coordinates(@game.players[0], @game.ships1[1].length)

    assert @game.board1.valid_placement?(@game.ships1[0], coordinates1)
    assert @game.board1.valid_placement?(@game.ships1[1], coordinates2)
  end
end
