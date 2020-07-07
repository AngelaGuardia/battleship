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
    assert_equal "Destroyer", @destoryer.type
  end

  def test_it_has_a_length
    assert_equal 3, @cruiser.length
  end

  def test_it_can_have_a_different_length
    assert_equal 2, @destroyer.length
  end
end
