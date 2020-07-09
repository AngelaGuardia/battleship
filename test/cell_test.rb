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

  def test_it_is_empty_by_default
    assert_equal(true, @cell1.empty?)
  end

  def test_it_can_have_a_ship_placed_on_it
    @cell1.place_ship(@cruiser)

    assert_equal(@cruiser, @cell1.ship)
    assert_equal(false, @cell1.empty?)
  end

  def test_it_is_not_fired_upon_by_default
    assert_equal(false, @cell1.fired_upon?)
  end

  def test_it_can_be_fired_upon_while_empty
    @cell1.fire_upon

    assert_equal true, @cell1.fired_upon?
  end

  def test_the_ship_health_decrements_when_fired_upon
    @cell1.place_ship(@cruiser)
    @cell1.fire_upon

    assert_equal(2, @cell1.ship.health)
  end

  def test_it_knows_that_it_has_been_fired_upon
    @cell1.place_ship(@cruiser)
    @cell1.fire_upon

    assert_equal(true, @cell1.fired_upon?)
  end

  def test_it_renders_a_period_if_empty_and_not_fired_upon
    assert_equal(".", @cell1.render)
  end

  def test_it_renders_a_M_if_empty_and_fired_upon
    @cell1.fire_upon

    assert_equal("M", @cell1.render)
  end

  def test_it_renders_a_period_if_occupied_but_optional_argument_not_provided
    @cell1.place_ship(@cruiser)

    assert_equal(".", @cell1.render)
  end

  def test_it_renders_H_if_occupied_and_fired_upon_provided
    @cell1.place_ship @cruiser

    assert_equal "H", @cell1.render
  end

  def test_it_renders_S_if_occupied_and_optional_argument_provided
    @cell1.place_ship(@cruiser)

    assert_equal("S", @cell1.render(true))
  end

  def test_it_doesnt_render_S_if_not_occupied_and_opt_arg_provided
  end

  def test_it_renders_a_X_if_occupied_and_ship_sunk
    @cell1.place_ship(@cruiser)
    @cell1.ship.hit
    @cell1.ship.hit
    @cell1.ship.hit

    assert_equal("X", @cell1.render)
  end
end
