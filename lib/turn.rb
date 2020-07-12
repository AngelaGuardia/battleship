class Turn
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def human_shot
    p enter_coord_msg
    input = gets.chomp
    while (!@player1.board.valid_coordinate?(input))
      p not_valid_coord_msg
      input = gets.chomp
    end
  end

  def enter_coord_msg
    "Enter the coordinate for your shot:"
  end

  def not_valid_coord_msg
    "Please enter a valid coordinate:"
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
