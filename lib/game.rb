class Game
  attr_reader :players
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
      place_computer_ships
      computer_message
      puts render_human_board
      place_human_ships
      turn = Turn.new(@players[0], @players[1])
      turn.start
    else
      puts "Thanks for Playing!"
    end
  end

  def get_user_input
    user_input = gets.chomp.downcase
    unless user_input == "q" || user_input == "p"
      puts "Enter p to play. Enter q to quit."
      get_user_input
    end
    user_input
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
end
