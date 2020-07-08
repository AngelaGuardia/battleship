require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell1 = Cell.new("B4")
    @cell2 = Cell.new("A2")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of(Cell, @cell1)
  end

  def test_it_has_a_coordinate
    assert_equal("B4", @cell1.coordinate)
  end

  def test_it_can_have_a_different_coordinate
    assert_equal("A2", @cell2.coordinate)
  end

  def test_it_has_nil_ship_by_default
    assert_nil(@cell1.ship)
  end

  def test_it_should_be_empty_by_default
    assert_equal(true, @cell1.empty?)
  end

  def test_it_should_be_able_to_have_a_ship_placed_on_it
    @cell1.place_ship(@cruiser)

    assert_equal(@cruiser, @cell1.ship)
    assert_equal(false, @cell1.empty?)
  end
end
