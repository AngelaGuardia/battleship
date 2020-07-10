class Player
  attr_reader :name, :ships, :is_computer
  def initialize(name, ships, is_computer = false)
    @name = name
    @ships = ships
    @is_computer = is_computer
  end

  def has_lost?
    @ships.all? do |ship|
      ship.sunk?
    end
  end
end
