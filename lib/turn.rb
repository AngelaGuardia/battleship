class Turn
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def computer_shot
    valid_cells = @player2.board.get_cells_not_fired_upon
    random_cell = @player2.board.get_random_cell(valid_cells)
    random_cell.fire_upon
  end

  def display_boards
    "=============COMPUTER BOARD=============\n" +
    @player2.board.render +
    "==============PLAYER BOARD==============\n" +
    @player1.board.render
  end
end
