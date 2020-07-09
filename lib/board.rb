class Board
  attr_reader :cells, :height
  def initialize(height = 4, width = 4)
    @height = height
    @width = width
    @cells = generate_cells
  end

  def board_letters
    ("A"..("A".ord + @height - 1).chr).to_a
  end

  def board_numbers
    ("1"..(@width.to_s)).to_a
  end

  def generate_cells
    generated_cells = {}

    board_letters.each do |letter|
      board_numbers.each do |number|
        generated_cells[letter + number] = Cell.new(letter + number)
      end
    end
    generated_cells
  end

  def valid_placement?(ship, coordinates)
    valid_coordinate?(coordinates) && valid_length?(ship, coordinates) && !overlapping_coordinates?(coordinates) && consecutive_coordinates?(ship, coordinates)
  end

  def valid_coordinate?(coordinates)
    coordinates.all? { |coordinate| @cells.key?(coordinate) }
  end

  def valid_length?(ship, coordinates)
    ship.length == coordinates.length
  end

  def overlapping_coordinates?(coordinates)
    coordinates.any? do |coordinate|
      @cells[coordinate].ship.class == Ship
    end
  end

  def consecutive_coordinates?(ship, coordinates)
    consecutive_row_coord = (coordinates.first..coordinates.last).to_a
    consecutive_row_letters = (coordinates.first[0]..coordinates.last[0]).to_a
    if on_same_row?(coordinates)
      consecutive_row_coord == coordinates
    elsif on_same_column?(coordinates)
      consecutive_row_letters == coordinates.map { |coordinate| coordinate[0] }
    # else it is diagonal or some other placement
    end
  end

  def on_same_row?(coordinates)
    row_letter = coordinates[0][0]
    coordinates.all? { |coordinate| coordinate[0] == row_letter }
  end

  def on_same_column?(coordinates)
    column_number = coordinates[0][1]
    coordinates.all? { |coordinate| coordinate[1] == column_number }
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end
end
