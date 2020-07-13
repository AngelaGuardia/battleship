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

  def shot_result_message
    if empty?
      " shot on #{@coordinate} was a miss."
    elsif @ship.sunk?
      " shot on #{@coordinate} sunk a #{@ship.type}."
    else
      " shot on #{@coordinate} hit."
    end
  end

  def place_ship(ship_object)
    @ship = ship_object
  end

  def render(reveal_ship = false)
    if empty?
      empty_render
    else
      occupied_render(reveal_ship)
    end
  end

  def empty_render
    if fired_upon?
      "M"
    else
      "."
    end
  end

  def occupied_render(reveal_ship)
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
