require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
    @player1 = Player("Human Bob", @ships)
    @player2 = Player("Computer", @ships, true)
  end

  def test_it_exists
    assert_instance_of Player, @player1
    assert_instance_of Player, @player2
  end
end
