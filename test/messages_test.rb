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

  def test_coordinates_prompt
    ship1 = {type: "Cruiser", length: 3}
    ship2 = {type: "Sub", length: 2}
    expected1 = "Enter the squares for the Cruiser (3 spaces):\n>"
    expected2 = "Enter the squares for the Sub (2 spaces):\n>"

    assert_equal expected1, Messages.coordinates_prompt(ship1)
    assert_equal expected2, Messages.coordinates_prompt(ship2)
  end

  def test_coordinates_reprompt
    expected = "Those are invalid coordinates. Please try again:\n>"

    assert_equal expected, Messages.coordinates_reprompt
  end

  def test_enter_pos_num
    expected = "Please enter a positive whole number from 4-9."

    assert_equal expected, Messages.enter_pos_num
  end

  def test_invalid
    assert_equal "Invalid input.", Messages.invalid
  end

  def test_end_game
    mock_ai_winner = {is_computer: true}
    mock_human_winner = {is_computer: false}
    expected_ai_win = "I won! I'm the AI ruler of the world!"
    expected_human_win = "You won! Woot woot!"

    assert_equal expected_ai_win, Messages.end_game(mock_ai_winner)
    assert_equal expected_human_win, Messages.end_game(mock_human_winner)
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

  def test_type_and_length
    ship1 = {type: "Cruiser", length: 3}
    ship2 = {type: "Sub", length: 2}

    assert_equal " Cruiser is 3 units long", Messages.type_and_length(ship1)
    assert_equal " Sub is 2 units long", Messages.type_and_length(ship2)
  end

  def test_custom_board_dimension_prompt
    expected_height = "Would you like to set a custom board height?\nEnter y to enter a custom board height. Enter n to continue."
    expected_width = "Would you like to set a custom board width?\nEnter y to enter a custom board width. Enter n to continue."

    assert_equal expected_height, Messages.custom_board_dimension_prompt("height")
    assert_equal expected_width, Messages.custom_board_dimension_prompt("width")
  end
end
