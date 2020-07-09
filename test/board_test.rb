require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new()
    #require 'pry'; binding.pry
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
end
