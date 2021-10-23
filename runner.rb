require './lib/ship'
require './lib/cell'
require './lib/coordinateclass'
require './lib/board'

board = Board.new
# # => #<Board:0x00007fcb0f056860...>
#
cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new('Sub', 2)

board.place(cruiser, ["A1", "A2", "A3"])
board.place(submarine, ['C1', 'D1'])

board.cells['A1'].fire_upon
board.cells['B1'].fire_upon
board.cells['A2'].fire_upon


board.cells['C1'].fire_upon
board.cells['D1'].fire_upon


board.render
