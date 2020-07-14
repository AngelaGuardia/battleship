require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class CellTest < Minitest::Test
  def test_main_menu_message
    assert_equal Messages.main_menu, "\n🚢Welcome to BATTLESHIP ⚓ 🏴‍☠️\nEnter p to play. Enter q to quit."
  end
end
