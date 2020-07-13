class Game
  attr_reader :players,
              :board1,
              :board2,
              :ships1,
              :ships2

  def initialize(players)
    @players = players
  end

  def print_main_menu
    "\n🚢Welcome to BATTLESHIP ⚓ 🏴‍☠️\nEnter p to play. Enter q to quit."
  end

  def start
    puts print_main_menu
    user_input = get_user_input
    if user_input == "p"
      create_boards
      create_ships
      place_computer_ships
      computer_message
      puts render_human_board
      place_human_ships
      turn = Turn.new(@players[0], @players[1])
      until @players[0].has_lost? || @players[1].has_lost?
        turn.human_shot
        turn.computer_shot
        puts turn.results
        puts turn.display_boards
      end
      # puts end_game(turn.game_winner)
      if @players[0].has_lost?
        puts end_game(@players[1])
      else
        puts end_game(@players[0])
      end
    else
      return "Thanks for Playing!"
    end
    start
  end

  def get_user_input
    user_input = gets.chomp.downcase
    unless user_input == "q" || user_input == "p"
      puts "Enter p to play. Enter q to quit."
      return get_user_input
    end
    user_input
  end

  def create_boards
    @board1 = Board.new
    @board2 = Board.new
  end

  def create_ships
    cruiser1 = Ship.new("Cruiser", 3)
    submarine1 = Ship.new("Submarine", 2)
    @ships1 = [cruiser1, submarine1]

    cruiser2 = Ship.new("Cruiser", 3)
    submarine2 = Ship.new("Submarine", 2)
    @ships2 = [cruiser2, submarine2]
  end

  def place_computer_ships
    @players.each do |player|
      if player.is_computer
        player.ships.each do |ship|
          coordinates = random_coordinates(player, ship.length)
          until player.board.valid_placement?(ship, coordinates)
            coordinates = random_coordinates(player, ship.length)
          end
          player.board.place(ship, coordinates)
        end
      end
    end
  end

  def random_coordinates(player, length)
    random_arrays = []
    board = player.board
    if [true, false].sample
      board.rows[board.board_letters.sample].each_cons(length) do |row|
        random_arrays << row
      end
    else
      board.columns[board.board_numbers.sample].each_cons(length) do |column|
        random_arrays << column
      end
    end
    random_arrays.sample
  end

  # TODO: will need to be modified to handle multiple ships in iteration 4
  def computer_message
    @players.each do |player|
      if !player.is_computer
        puts "\nI have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe #{player.ships[0].type} is #{player.ships[0].length} units long and the #{player.ships[1].type} is #{player.ships[1].length} units long.\n"
      end
    end
  end

  def render_human_board
    @players.select do |player|
      player.is_computer == false
    end[0].board.render
  end

  def place_human_ships
    @players.each do |player|
      if !player.is_computer
        player.ships.each do |ship|
          print coordinates_prompt(ship)
          coordinates = get_human_coordinates
          until player.board.valid_placement?(ship, coordinates)
            print coordinates_reprompt
            coordinates = get_human_coordinates
          end
          player.board.place(ship, coordinates)
        end
      end
    end
  end

  def coordinates_prompt(ship)
    "Enter the squares for the #{ship.type} (#{ship.length} spaces):\n>"
  end

  def get_human_coordinates
    gets.chomp.upcase.split(" ")
  end

  def coordinates_reprompt
    "Those are invalid coordinates. Please try again:\n>"
  end

  def end_game(winner)
    if winner.is_computer
      "I won! I'm the AI ruler of the world!"
    else
      "You won! Woot woot!"
    end
  end

  def custom_board_width_message
    puts "Would you like to set a custom board width? Enter y to enter a custom board width. Enter n to continue."
    user_input = gets.chomp.downcase
    if (user_input == "y")
      puts "Please enter a number for what you want the width of the board to be."
      user_input = gets.chomp.downcase.to_i
      unless user_input.is_a(Integer) && user_input > 1
        puts "Invalid input. Please enter a positive whole number. For example 5 10 or 8 are all valid options"
        user_input = gets.chomp.downcase.to_i
      end
      puts "Setting the board width to be #{user_input}"
      @players.each do |player|
        player.board.set_width(user_input)
      end
    else
      puts "Continuing with the default width of 4."
    end
  end

  def custom_board_width_message
    puts "Would you like to set a custom board height? Enter y to enter a custom board height. Enter n to continue."
    user_input = gets.chomp.downcase
    if (user_input == "y")
      puts "Please enter a number for what you want the height of the board to be."
      user_input = gets.chomp.downcase.to_i
      unless user_input.is_a(Integer) && user_input > 1
        puts "Invalid input. Please enter a positive whole number that is greater than 1. For example 5 10 or 8 are all valid options"
        user_input = gets.chomp.downcase.to_i
      end
      puts "Setting the board width to be #{user_input}"
      @players.each do |player|
        player.board.set_height(user_input)
      end
    else
      puts "Continuing with the default height of 4."
    end
  end
end
