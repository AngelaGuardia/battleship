class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    @ship.hit if @ship
  end

  def place_ship(ship_object)
    @ship = ship_object
  end

  def render(reveal_ship = false)
    if empty?
      if fired_upon?
        "M"
      else
        "."
      end
    else
      if @ship.sunk?
        "X"
      elsif @fired_upon
        "H"
      elsif reveal_ship
        "S"
      else
        "."
      end
    end
  end

  # def render3(reveal = false)
  #   if !fired_upon?
  #     require 'pry'; binding.pry
  #     "." unless reveal_ship(reveal)
  #   elsif empty?
  #     "M"
  #   end
  # end
  #
  # def reveal_ship(reveal)
  #   return "S" if reveal && !empty?
  # end
  #
  # def render2(reveal_ship = false)
  #   if !fired_upon?
  #     if reveal_ship
  #       "S"
  #     end
  #     "."
  #   elsif empty?
  #     "M"
  #   elsif @ship.sunk?
  #     "X"
  #   else
  #     "H"
  #   end
  # end
end
