require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @cruiser1 = Ship.new("Cruiser", 3)
    @submarine1 = Ship.new("Submarine", 2)
    @ships1 = [@cruiser1, @submarine1]
    @player1 = Player.new("Alan Turing", @ships1)
    @cruiser2 = Ship.new("Cruiser", 3)
    @submarine2 = Ship.new("Submarine", 2)
    @ships2 = [@cruiser2, @submarine2]
    @player2 = Player.new("Watson", @ships2, true)

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
end
