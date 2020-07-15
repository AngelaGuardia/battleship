require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class CellTest < Minitest::Test
  def test_main_menu_message
    expected = "\n🚢Welcome to BATTLESHIP ⚓ 🏴‍☠️\nEnter p to play. Enter q to quit."

    assert_equal expected, Messages.main_menu
  end

  def test_thanks_for_playing
    expected = "Thanks for Playing!"

    assert_equal expected, Messages.thanks
  end

  def test_play_or_quit
    expected = "Enter p to play. Enter q to quit."

    assert_equal expected, Messages.play_or_quit
  end

  def test_layout
    ship1 = {type: "Cruiser", length: 3}
    ship2 = {type: "Sub", length: 2}
    ship3 = {type: "Battleship", length: 4}
    ships1 = [ship1, ship2, ship3]
    ships2 = [ship1, ship2]
    expected1 = "\nI have laid out my ships on the grid.\nYou now need to lay out your 3 ships.\nThe Cruiser is 3 units long, the Sub is 2 units long, and the Battleship is 4 units long.\n"
    expected2 = "\nI have laid out my ships on the grid.\nYou now need to lay out your 3 ships.\nThe Cruiser is 3 units long, and the Sub is 2 units long.\n"

    assert_equal expected1, Messages.layout(ships1)
    assert_equal expected2, Messages.layout(ships2)
  end

  def test_conjunction_helper_first_index
    mock_ships = [{}, {}, {}]

    assert_equal "The", Messages.conjunction_helper(mock_ships, 0)
  end

  def test_conjunction_helper_middle_index
    mock_ships = [{}, {}, {}]

    assert_equal ", the", Messages.conjunction_helper(mock_ships, 1)
  end

  def test_conjunction_helper_last_index
    mock_ships = [{}, {}, {}]

    assert_equal ", and the", Messages.conjunction_helper(mock_ships, 2)
  end

  def test_end_message
    mock_ships = [{}, {}, {}]
    not_last_index = 1
    last_index = 2

    assert_equal "", Messages.check_end_message(mock_ships, not_last_index)
    assert_equal ".\n", Messages.check_end_message(mock_ships, last_index)
  end
end
