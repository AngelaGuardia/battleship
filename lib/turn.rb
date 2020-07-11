class Turn
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def display_boards
    "=============COMPUTER BOARD=============\n" +
    @player2.board.render +
    "==============PLAYER BOARD==============\n" +
    @player1.board.render
  end
end
