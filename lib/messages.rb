class Messages
  def self.main_menu
    "\n🚢Welcome to BATTLESHIP ⚓ 🏴‍☠️\nEnter p to play. Enter q to quit."
  end

  def self.thanks
    "Thanks for Playing!"
  end

  def self.play_or_quit
    "Enter p to play. Enter q to quit."
  end

  def self.layout ships
    message = "\nI have laid out my ships on the grid.\nYou now need to lay out your 3 ships.\n"
    ships.each_with_index do |ship, curr_i|
      message += Messages.conjunction_helper(ships, curr_i)
      message += " #{ship[:type]} is #{ship[:length]} units long"
      if is_last
        message += ".\n"
      end
    end
    message
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
