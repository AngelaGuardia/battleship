class Player
  attr_reader :name, :ships, :board, :is_computer
  def initialize(name, ships, board, is_computer = false)
    @name = name
    @ships = ships
    @board = board
    @is_computer = is_computer
  end

  def has_lost?
    @ships.all? do |ship|
      ship.sunk?
    end
  end
end
