require './lib/gameplay'; Gameplay.new.start
# require './lib/board'
# board = Board.new(4,4)
# board.render
# p board.cells

# def setup
#   puts "Please pick a height for you board. The options are 1-26."
#   height = gets.chomp.to_i
#   while height.to_i > 26 || height.to_i < 1
#     puts "You have not followed the directions. Try again. Choose 1 - 26!"
#     height = gets.chomp.to_i
#   end
#
#   puts "Please pick a width for you board. The options are 1 - your hearts desire."
#   width = gets.chomp.to_i
#
#   puts "You have chosen a #{height} by #{width} board."
#
#   @computer_board = Board.new(height, width)
#   @player_board = Board.new(height, width)
# end
# setup
# @computer_board.render
# @player_board.render
