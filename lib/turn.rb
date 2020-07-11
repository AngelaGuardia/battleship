class Turn
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def human_shot
    p "Enter the coordinate for your shot:"
    input = gets.chomp
    while (!@player1.board.valid_coordinate?(input))
      p "Please enter a valid coordinate:"
      input = gets.chomp
    end
  end

  def display_boards
    "=============COMPUTER BOARD=============\n" +
    @player2.board.render +
    "==============PLAYER BOARD==============\n" +
    @player1.board.render
  end
end
