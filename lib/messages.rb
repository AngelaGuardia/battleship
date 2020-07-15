class Messages
  def self.main_menu
    "\n🚢Welcome to BATTLESHIP ⚓ 🏴‍☠️\nEnter p to play. Enter q to quit."
  end

  def self.play_or_quit
    "Enter p to play. Enter q to quit."
  end

  def self.thanks
    "Thanks for Playing!"
  end

  def self.coordinates_prompt(ship)
    "Enter the squares for the #{ship[:type]} (#{ship[:length]} spaces):\n>"
  end

  def self.coordinates_reprompt
    "Those are invalid coordinates. Please try again:\n>"
  end

  def self.custom_board_dimension_prompt dimension_type
    "Would you like to set a custom board #{dimension_type}?\nEnter y to enter a custom board #{dimension_type}. Enter n to continue."
  end

  def self.set_dimension(dimension_type, n)
    "Setting the board #{dimension_type} to be #{n}"
  end

  def self.enter_pos_num
    "Please enter a positive whole number from 4-9."
  end

  def self.use_default_dimension dimension
    "Continuing with the default #{dimension} of 4."
  end

  def self.invalid
    "Invalid input."
  end

  def self.end_game(winner)
    if winner[:is_computer]
      "I won! I'm the AI ruler of the world!"
    else
      "You won! Woot woot!"
    end
  end

  def self.layout ships
    message = "\nI have laid out my ships on the grid.\nYou now need to lay out your 3 ships.\n"
    ships.each_with_index do |ship, curr_i|
      message += Messages.conjunction_helper(ships, curr_i)
      message += Messages.type_and_length ship
      message += Messages.check_end_message(ships, curr_i)
    end
    message
  end

  def self.type_and_length ship
    " #{ship[:type]} is #{ship[:length]} units long"
  end

  def self.check_end_message(ships, curr_i)
    last_i = ships.length - 1
    is_last = curr_i == last_i

    if is_last
      ".\n"
    else
      ""
    end
  end

  def self.conjunction_helper(ships, curr_i)
    last_i = ships.length - 1
    is_first = curr_i == 0
    is_last = curr_i == last_i

    if is_first
      "The"
    elsif is_last
      ", and the"
    else
      ", the"
    end
  end
end
