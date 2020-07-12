require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/game"

class GameTest < Minitest::Test
  def setup
    @board1 = Board.new()
    @cruiser1 = Ship.new("Cruiser", 3)
    @submarine1 = Ship.new("Submarine", 2)
    @ships1 = [@cruiser1, @submarine1]
    @player1 = Player.new("Ada Lovelace", @ships1, @board1)

    @board2 = Board.new()
    @cruiser2 = Ship.new("Cruiser", 3)
    @submarine2 = Ship.new("Submarine", 2)
    @ships2 = [@cruiser2, @submarine2]
    @player2 = Player.new("Watson", @ships2, @board2, true)

    @players = [@player1, @player2]
    @game = Game.new(@players)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  #can't test_it_prints_out_main_menu
  #can't test_get_user_input

  def test_it_has_players
    assert_instance_of Player, @game.players[0]
    assert_instance_of Player, @game.players[1]
  end

  # TODO: I don't think we need to test that it CAN place ships
  # that's a board method and was tested there but we should somethow
  # test that it places ships randonly
  def test_it_can_randomly_place_computer_ships_on_the_board
  end

  def test_it_can_generate_random_valid_coordinates
    coordinates1 = @game.random_coordinates(@player1, @cruiser1.length)
    coordinates2 = @game.random_coordinates(@player1, @submarine1.length)

    assert @board1.valid_placement?(@cruiser1, coordinates1)
    assert @board1.valid_placement?(@submarine1, coordinates2)
  end

  def test_it_prints_a_message_after_computer_ship_placement
    expected = "\nI have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long.\n"

    assert expected, @game.computer_message
  end

  # QUESTION: is this test redundant since we've already tested that the board can render?
  def test_it_renders_the_humans_board
    expected = "  1 2 3 4 \n" +
               "A . . . . \n" +
               "B . . . . \n" +
               "C . . . . \n" +
               "D . . . . \n"
    assert_equal expected, @game.render_human_board
  end

  def test_it_prints_prompt_to_enter_coordinates
    assert_equal "Enter the squares for the Cruiser (3 spaces):\n>", @game.coordinates_prompt(@cruiser1)
  end

  def test_it_prints_REprompt_to_enter_valid_coordinates
    assert_equal "Those are invalid coordinates. Please try again:\n>" , @game.coordinates_reprompt
  end
end
