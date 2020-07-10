require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/game"

class GameTest < Minitest::Test
  def setup
    @cruiser1 = Ship.new("Cruiser", 3)
    @submarine1 = Ship.new("Submarine", 2)
    @ships1 = [@cruiser1, @submarine1]
    @player1 = Player.new("Ada Lovelace", @ships1)

    @cruiser2 = Ship.new("Cruiser", 3)
    @submarine2 = Ship.new("Submarine", 2)
    @ships2 = [@cruiser2, @submarine2]
    @player2 = Player.new("Watson", @ships2, true)

    @game = Game.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  #can't test_it_prints_out_main_menu
  #can't test_get_user_input
end
