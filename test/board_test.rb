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

  def test_it_knows_a_ship_placement_has_a_valid_length
    assert_equal false, @board.valid_length?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_length?(@submarine, ["A2", "A3", "A4"])
  end

  def test_it_knows_when_all_coordinates_are_on_the_same_row
    assert_equal true, @board.on_same_row?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.on_same_row?(@cruiser, ["A1", "B1", "C1"])
  end

  def test_it_knows_when_all_coordinates_are_on_the_same_column
    assert_equal false, @board.on_same_column?(@cruiser, ["A1", "A2", "A4"])
    assert_equal true, @board.on_same_column?(@cruiser, ["A1", "B1", "C1"])
  end

  def test_it_knows_a_ship_placement_has_consecutive_coordinates
    refute @board.consecutive_coordinates?(@cruiser, ["A1", "A2", "A4"])
    refute @board.consecutive_coordinates?(@submarine, ["A1", "C1"])
    refute @board.consecutive_coordinates?(@cruiser, ["A3", "A2", "A1"])
    refute @board.consecutive_coordinates?(@submarine, ["C1", "B1"])
    assert_equal true, @board.consecutive_coordinates?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.consecutive_coordinates?(@cruiser, ["A1", "B1", "C1"])

  end

  # def test_it_knows_a_ship_has_a_valid_placement
  #   assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
  #   assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  # end
end
