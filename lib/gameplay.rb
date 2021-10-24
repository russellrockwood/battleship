require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/coordinateclass'

class Gameplay

  def initialize #()

    @computer_board = Board.new
    @player_board = Board.new

  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    response = gets.chomp
    response
    case response
    when 'p'
      setup
    when 'q'
      puts "Thanks for stopping by!"
    else
      puts "Invalid input. Try again."
      main_menu
    end

  end

  def setup
    puts 'Hello'
  end

end
