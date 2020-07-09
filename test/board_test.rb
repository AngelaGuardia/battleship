require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new()
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_board_can_generate_an_array_of_coordinate_letters_default
    assert_equal ["A", "B", "C", "D"], @board.board_letters
  end

  def test_board_can_generate_an_array_of_coordinate_letters_dynamic
    board = Board.new(6)

    assert_equal ["A", "B", "C", "D", "E", "F"], board.board_letters
  end

  def test_board_can_generate_an_array_of_coordinate_numbers_default
    assert_equal ["1", "2", "3", "4"], @board.board_numbers
  end

  def test_board_can_generate_an_array_of_coordinate_numbers_dynamic
    board = Board.new(6 , 6)

    assert_equal ["1", "2", "3", "4", "5", "6"], board.board_numbers
  end

  def test_it_generates_and_stores_cells_default
    board_cells = @board.cells
    board_cell_values = board_cells.values

    assert_instance_of Hash, board_cells
    assert_equal 16, board_cells.length
    assert_instance_of Cell, board_cell_values[0]
  end

  def test_it_generates_and_stores_cells_dynamic
    board = Board.new(6 , 6)
    size = 6 * 6
    board_cells = board.cells
    board_cell_values = board_cells.values

    assert_instance_of Hash, board_cells
    assert_equal size, board_cells.length
    assert_instance_of Cell, board_cell_values[0]
  end

  def test_it_generates_and_stores_cells_dynamic_rectangular
    board = Board.new(4 , 6)
    size = 4 * 6
    board_cells = board.cells
    board_cell_values = board_cells.values

    assert_instance_of Hash, board_cells
    assert_equal size, board_cells.length
    assert_instance_of Cell, board_cell_values[0]

    board = Board.new(7 , 5)
    size = 7 * 5
    board_cells = board.cells
    board_cell_values = board_cells.values

    assert_instance_of Hash, board_cells
    assert_equal size, board_cells.length
    assert_instance_of Cell, board_cell_values[0]
  end

  def test_it_knows_a_ship_placement_is_on_valid_coordinates
    assert_equal false, @board.valid_coordinate?(["A3", "A4", "A5"])
    assert_equal true, @board.valid_coordinate?(["A2", "A3", "A4"])
  end

  def test_it_knows_a_ship_placement_has_a_valid_length
    assert_equal false, @board.valid_length?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_length?(@submarine, ["A2", "A3", "A4"])
  end

  def test_it_knows_when_all_coordinates_are_on_the_same_row
    assert_equal true, @board.on_same_row?(["A1", "A2", "A4"])
    assert_equal false, @board.on_same_row?(["A1", "B1", "C1"])
  end

  def test_it_knows_when_all_coordinates_are_on_the_same_column
    assert_equal false, @board.on_same_column?(["A1", "A2", "A4"])
    assert_equal true, @board.on_same_column?(["A1", "B1", "C1"])
  end

  def test_it_knows_a_ship_placement_has_consecutive_coordinates
    refute @board.consecutive_coordinates?(@cruiser, ["A1", "A2", "A4"])
    refute @board.consecutive_coordinates?(@submarine, ["A1", "C1"])
    refute @board.consecutive_coordinates?(@cruiser, ["A3", "A2", "A1"])
    refute @board.consecutive_coordinates?(@submarine, ["C1", "B1"])
    assert_equal true, @board.consecutive_coordinates?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.consecutive_coordinates?(@cruiser, ["A1", "B1", "C1"])

  end

  def test_it_knows_a_ship_has_a_valid_placement
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A2", "A3", "A4"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A4", "A5"])
  end

  def test_it_can_place_ships_on_its_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert_instance_of Ship, cell_1.ship
    assert_instance_of Ship, cell_2.ship
    assert_instance_of Ship, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_it_knows_if_placed_ships_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal true, @board.overlapping_coordinates?(["A1", "B1"])
    assert_equal false, @board.overlapping_coordinates?(["C1", "D1"])

    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_it_renders
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expected_board_render1 =  "  1 2 3 4 \n" +
                              "A . . . . \n" +
                              "B . . . . \n" +
                              "C . . . . \n" +
                              "D . . . . \n"

    assert_equal expected_board_render1, @board.render

    expected_board_render2 =  "  1 2 3 4 \n" +
                              "A S S S . \n" +
                              "B . . . . \n" +
                              "C . . . . \n" +
                              "D . . . . \n"

    assert_equal expected_board_render2, @board.render(true)
  end

  def test_it_renders_non_standard_boards
    board1 = Board.new(6 , 6)
    board1.place(@cruiser, ["B2", "B3", "B4"])
    expected_board1_render =  "  1 2 3 4 5 6 \n" +
                              "A . . . . . . \n" +
                              "B . . . . . . \n" +
                              "C . . . . . . \n" +
                              "D . . . . . . \n" +
                              "E . . . . . . \n" +
                              "F . . . . . . \n"

    assert_equal expected_board1_render, board1.render

    expected_board1_render_true =  "  1 2 3 4 5 6 \n" +
                                   "A . . . . . . \n" +
                                   "B . S S S . . \n" +
                                   "C . . . . . . \n" +
                                   "D . . . . . . \n" +
                                   "E . . . . . . \n" +
                                   "F . . . . . . \n"

    assert_equal expected_board1_render_true, board1.render(true)

    board2 = Board.new(3 , 6)
    board2.place(@cruiser, ["B2", "B3", "B4"])
    expected_board2_render =  "  1 2 3 4 5 6 \n" +
                              "A . . . . . . \n" +
                              "B . . . . . . \n" +
                              "C . . . . . . \n"

    assert_equal expected_board2_render, board2.render

    expected_board2_render_true =  "  1 2 3 4 5 6 \n" +
                                   "A . . . . . . \n" +
                                   "B . S S S . . \n" +
                                   "C . . . . . . \n"

    assert_equal expected_board2_render_true, board2.render(true)
  end
end
