class Game
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def print_main_menu
    puts "🚢Welcome to BATTLESHIP ⚓ 🏴‍☠️\nEnter p to play. Enter q to quit."
  end

  def start
    print_main_menu
    user_input = get_user_input
    if user_input == "p"
      #create New turn
      # Turn.start_turn
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

end
