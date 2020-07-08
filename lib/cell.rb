class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship
  end

  def empty?
    return @ship == nil
  end
end
