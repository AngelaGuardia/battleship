require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/turn"
require "./lib/game"

board1 = Board.new()
cruiser1 = Ship.new("Cruiser", 3)
submarine1 = Ship.new("Submarine", 2)
ships1 = [cruiser1, submarine1]
player1 = Player.new("Ada Lovelace", ships1, board1)

board2 = Board.new()
cruiser2 = Ship.new("Cruiser", 3)
submarine2 = Ship.new("Submarine", 2)
ships2 = [cruiser2, submarine2]
player2 = Player.new("Watson", ships2, board2, true)

players = [player1, player2]
game = Game.new(players)

game.start
