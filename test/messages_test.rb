require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class CellTest < Minitest::Test
  def test_main_menu_message
    assert_equal Messages.main_menu, "\n🚢Welcome to BATTLESHIP ⚓ 🏴‍☠️\nEnter p to play. Enter q to quit."
  end

  def test_thanks_for_playing
    assert_equal Messages.thanks, "Thanks for Playing!"
  end

  def test_play_or_quit
    assert_equal Messages.play_or_quit, "Enter p to play. Enter q to quit."
  end
end
