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

  def test_layout
    ship1 = {type: "Cruiser", length: 3}
    ship2 = {type: "Sub", length: 2}
    ship3 = {type: "Battleship", length: 4}
    ships1 = [ship1, ship2, ship3]
    ships2 = [ship1, ship2]

    assert_equal Messages.layout(ships1), "\nI have laid out my ships on the grid.\nYou now need to lay out your 3 ships.\nThe Cruiser is 3 units long, the Sub is 2 units long, and the Battleship is 4 units long.\n"
    assert_equal Messages.layout(ships2), "\nI have laid out my ships on the grid.\nYou now need to lay out your 3 ships.\nThe Cruiser is 3 units long, and the Sub is 2 units long.\n"
  end

  def test_conjunction_helper_first_index
    ship1 = {type: "Cruiser", length: 3}
    ship2 = {type: "Sub", length: 2}
    ship3 = {type: "Battleship", length: 4}
    ships = [ship1, ship2, ship3]

    assert_equal Messages.conjunction_helper(ships, 0), "The"
  end

  def test_conjunction_helper_middle_index
    ship1 = {type: "Cruiser", length: 3}
    ship2 = {type: "Sub", length: 2}
    ship3 = {type: "Battleship", length: 4}
    ships = [ship1, ship2, ship3]

    assert_equal Messages.conjunction_helper(ships, 1), ", the"
  end

  def test_conjunction_helper_last_index
    ship1 = {type: "Cruiser", length: 3}
    ship2 = {type: "Sub", length: 2}
    ship3 = {type: "Battleship", length: 4}
    ships = [ship1, ship2, ship3]

    assert_equal Messages.conjunction_helper(ships, 2), ", and the"
  end
end
