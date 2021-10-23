require './lib/ship'
require './lib/cell'
require './lib/coordinateclass'
require './lib/board'

board = Board.new
# # => #<Board:0x00007fcb0f056860...>
#
cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007fcb0f0573f0...>
#
board.place(cruiser, ["A1", "A2", "A3"])
#
board.render
