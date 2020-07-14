class Turn
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @p1_shot_cell = nil
    @p2_shot_cell = nil
  end

  def human_shot
    p enter_coord_msg
    input = gets.chomp.upcase
    while (!@player2.board.valid_coordinates?(input))
      p not_valid_coord_msg
      input = gets.chomp.upcase
    end
    targetCell = @player2.board.cells[input]
    targetCell.fire_upon
    @p1_shot_cell = targetCell
  end

  def enter_coord_msg
    "Enter the coordinate for your shot:"
  end

  def not_valid_coord_msg
    "Please enter a valid coordinate:"
  end

  def computer_shot
    board = @player1.board
    cells_hit = board.get_cells_hit
    if !cells_hit.empty?
      valid_cells = board.get_cells_not_fired_upon(board.adjacent_cells(cells_hit))
      random_cell = valid_cells.sample
    else
      valid_cells = board.get_cells_not_fired_upon
      random_cell = board.get_random_cell(valid_cells)
    end
    random_cell.fire_upon
    @p2_shot_cell = random_cell
  end

  def display_boards
    "=============COMPUTER BOARD=============\n" +
    @player2.board.render +
    "==============PLAYER BOARD==============\n" +
    @player1.board.render
  end

  def results
    "Your" + @p1_shot_cell.shot_result_message + "\n" +
    "My" + @p2_shot_cell.shot_result_message
  end
end
