class Board
  attr_reader :cells, :height
  def initialize(height = 4, width = 4)
    #require 'pry'; binding.pry
    @cells #= generate_cells
    @height = height
    @width = width
  end

  def board_letters
    ("A"..("A".ord + @height - 1).chr).to_a
  end

  def board_numbers
    ("1"..(@width.to_s)).to_a
  end

  # def generate_cells
  #   generated_cells = {}
  #
  #   board_letters.each do |letter|
  #     board_numbers.each do |number|
  #       generated_cells[letter + number] = "new cell"
  #     end
  #   end
  #   generated_cells
  # end
end
