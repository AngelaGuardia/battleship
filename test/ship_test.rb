require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @destroyer = Ship.new("Destroyer", 2)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_a_type
    assert_equal "Cruiser", @cruiser.type
  end

  def test_it_can_have_a_different_type
    assert_equal "Destroyer", @destroyer.type
  end

  def test_it_has_a_length
    assert_equal 3, @cruiser.length
  end

  def test_it_can_have_a_different_length
    assert_equal 2, @destroyer.length
  end

  def test_it_has_health
    assert_equal 3, @cruiser.health
  end

  def test_it_can_have_a_different_health
    assert_equal 2, @destroyer.health
  end

  def test_it_can_get_hit
    @cruiser.hit

    assert_equal 2, @cruiser.health
  end

  def test_it_knows_if_it_knows_its_sunk
    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    assert_equal true, @cruiser.sunk?
  end
end
