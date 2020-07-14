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
    ships.each_with_index do |ship, i|
      last_index = i == ships.length - 1
      if i == 0
        message += "The"
      elsif last_index
        message += ", and the"
      else
        message += ", the"
      end
      message += " #{ship[:type]} is #{ship[:length]} units long"
      if last_index
        message += ".\n"
      end
    end
    message
  end
end
