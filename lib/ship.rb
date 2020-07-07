class Ship
  attr_reader :type, :length, :health
  def initialize(type, length)
    @type = type
    @length = length
    @health = length
  end
end
