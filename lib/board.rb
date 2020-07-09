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
    valid_length?(ship, coordinates)
  end

  def valid_length?(ship, coordinates)
    ship.length == coordinates.length
  end
end
