require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new()
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_board_can_generate_an_array_of_coordinate_letters_default
    assert_equal ["A", "B", "C", "D"], @board.board_letters
  end

  # def test_it_has_cells
  #   board_cells = @board.cells
  #   board_cell_values = board_cells.values
  #
  #   assert_instance_of Hash, board_cells
  #   assert_equal 16, board_cells.length
  #   assert_instance_of Cell, board_cell_values[0]
  # end
end
