class Board
  attr_reader :cells
  def initialize(height = 4, width = 4)
    @cells #= generate_cells
    @height = height
    @width = width
  end

  # def generate_cells
  #   letters = ("A"..("A".ord + height - 1).chr).to_a
  #   numbers = ("1"..(width.to_s)).to_a
  #
  #   cells = {}
  #
  #   letters.each do |letter|
  #     numbers.each do |number|
  #       cells[letter + number] = "new cell"
  #     end
  #   end
  #   cells
  # end

  def board_letters
    ("A"..("A".ord + @height - 1).chr).to_a
  end
end
