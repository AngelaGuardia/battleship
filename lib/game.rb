class Game
  attr_reader :players
  def initialize(players)
    @players = players
  end

  def print_main_menu
    puts "🚢Welcome to BATTLESHIP ⚓ 🏴‍☠️\nEnter p to play. Enter q to quit."
  end

  def start
    print_main_menu
    user_input = get_user_input
    if user_input == "p"
      place_computer_ships
      #create New turn
      # Turn.start_turn
      puts end_game(turn.game_winner)
    else
      return "Thanks for Playing!"
    end
    start
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

  def end_game(winner)
    if winner.is_computer
      "I won! I'm the AI ruler of the world!"
    else
      "You won! Woot woot!"
    end
  end
end
