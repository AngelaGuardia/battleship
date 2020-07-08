class Ship
  attr_reader :type, :length, :health
  def initialize(type, length)
    @type = type
    @length = length
    @health = length
  end

  def sunk?
    health < 1
  end

  def hit
    @health -= 1
  end
end
