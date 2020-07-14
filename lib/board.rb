require './lib/cell'

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
    board_letters.reduce({}) do |generated_cells, letter|
      board_numbers.each do |number|
        generated_cells[letter + number] = Cell.new(letter + number)
      end
      generated_cells
    end
  end

  def valid_placement?(ship, coordinates)
    valid_coordinates?(coordinates) && valid_length?(ship, coordinates) && !overlapping_coordinates?(coordinates) && consecutive_coordinates?(coordinates)
  end

  def valid_coordinates?(coordinates)
    if coordinates.is_a?(String)
      @cells.key?(coordinates.upcase)
    else
      coordinates.all? { |coordinate| @cells.key?(coordinate.upcase) }
    end
  end

  def get_cells_not_fired_upon
    unhit_cells = []
    @cells.keys.each do |key|
      if !@cells[key].fired_upon?
        unhit_cells << cells[key]
      end
    end
    unhit_cells
  end

  def get_random_cell(cells)
    cells.shuffle[0]
  end

  def valid_length?(ship, coordinates)
    ship.length == coordinates.length
  end

  def overlapping_coordinates?(coordinates)
    coordinates.any? do |coordinate|
      @cells[coordinate].ship.class == Ship
    end
  end

  def consecutive_coordinates?(coordinates)
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

  def render(reveal_ship = false)
    board_string = render_top_row
    @cells.each do |coord, cell|
      first_column = coord[1] == "1"
      last_column = coord[1] == @width.to_s

      if first_column
        column_letter = coord[0]
        board_string += column_letter + " "
      end

      board_string += cell.render(reveal_ship) + " "

      if last_column
        board_string += "\n"
      end
    end
    board_string
  end

  def render_top_row
    "  #{board_numbers.join(" ")} \n"
  end

  def rows
    cells.keys.group_by { |coord| coord[0] }
  end

  def columns
    cells.keys.group_by { |coord| coord[1] }
  end

  def adjacent_coords(coord)
    cons_arrays = []
    rows[coord[0]].each_cons(2) do |cons_elements|
      cons_arrays << cons_elements
    end

    columns[coord[1]].each_cons(2) do |cons_elements|
      cons_arrays << cons_elements
    end

    cons_arrays = cons_arrays.find_all do |ary|
      ary.include?(coord)
    end
    cons_arrays.flatten!.uniq!
    cons_arrays.delete(coord)
    cons_arrays
  end
end
