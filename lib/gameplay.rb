
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/coordinateclass'

class Gameplay

  # def initialize

    # @computer_board = Board.new ** moved to start method
    # @player_board = Board.new  ** moved to start method
    # @cruiser = Ship.new("Cruiser", 3)
    # @submarine = Ship.new("Submarine", 2)

  # end

  # def main_menu
  #   puts "Welcome to BATTLESHIP"
  #   puts "Enter p to play. Enter q to quit."
  #   response = gets.chomp
  #   response
    # case response
    # when 'p'
    #   setup
    # when 'q'
    #   puts "Thanks for stopping by!"
    # else
    #   puts "Invalid input. Try again."
    # end
  # end
  def start
    keep_playing = true
    while keep_playing
      puts "Welcome to BATTLESHIP"
      puts "Enter p to play. Enter q to quit."
      response = gets.chomp

      case response
      when 'p'
        setup
        play_game
      when 'q'
        puts "Thanks for stopping by!"
        keep_playing = false
      else
        puts "Invalid input. Try again."
      end

    end

  end


  def random_sub_coordinates # renamed function
    acceptable_coordinates = false
    while !acceptable_coordinates
      possible_number_combinations = (1..4).each_cons(2).to_a
      letters = ('A'..'D').each_cons(2).to_a
      random_letter = Random.new.rand(65..68).chr
      random_number = Random.new.rand(1..4)
      random_cons_num_array = possible_number_combinations[Random.new.rand(3)] #array[1]
      random_sub_placement_across = random_cons_num_array.map do |num|
        random_letter + num.to_s
      end
      random_cons_letters_array = letters[Random.new.rand(3)]
      random_sub_placement_down = random_cons_letters_array.map do |letter|
        letter + random_number.to_s
      end
      random_sub_placement_down
      random_sub_placement_across
      array = []
      array << random_sub_placement_down
      array << random_sub_placement_across
      random_coordinates = array.sample
      acceptable_coordinates = @computer_board.valid_placement?(@computer_submarine, random_coordinates)

      if !acceptable_coordinates
        next
      else
        return random_coordinates
      end

    end

  end


  def random_cruiser_coordinates # renamed function
    possible_number_combinations = (1..4).each_cons(3).to_a
    letters = ('A'..'D').each_cons(3).to_a
    random_letter = Random.new.rand(65..68).chr
    random_number = Random.new.rand(1..4)
    random_cons_num_array = possible_number_combinations[Random.new.rand(2)]
    random_sub_placement_across = random_cons_num_array.map do |num|
    random_letter + num.to_s
    end
    random_cons_letters_array = letters[Random.new.rand(2)]
    random_sub_placement_down = random_cons_letters_array.map do |letter|
      letter + random_number.to_s
    end
    random_sub_placement_down
    random_sub_placement_across
    array = []
    array << random_sub_placement_down
    array << random_sub_placement_across
    array.sample
  end


  def setup
    @computer_board = Board.new # boards need to reset every game
    @player_board = Board.new

    @computer_cruiser = Ship.new("Cruiser", 3) # ships need to reset every game
    @computer_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3) # player and computer were using same ship caused errors
    @player_submarine = Ship.new("Submarine", 2)

    @computer_board.place(@computer_cruiser, random_cruiser_coordinates) # moved from main_menu
    @computer_board.place(@computer_submarine, random_sub_coordinates) # moved from main_menu

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render(true)

    ships_not_placed = true
    placement_attempts = 4

    while ships_not_placed && placement_attempts > 0 do

      cruiser_not_placed = true
      while cruiser_not_placed && placement_attempts > 0 do

        puts "Enter the squares for the Cruiser (3 spaces):"
        # cruiser_coordinates = gets.chomp
        cruiser_coordinates = 'A1 A2 A3' # ** automatic placement for testing **
        cruiser_coordinates = cruiser_coordinates.split(" ")

        valid_coordinates = true
        cruiser_coordinates.each do |coordinate|
          if !@player_board.valid_coordinate?(coordinate)
              valid_coordinates = false
          end
        end

        valid_placement = @player_board.valid_placement?(@player_cruiser, cruiser_coordinates)

        if valid_coordinates && valid_placement
          @player_board.place(@player_cruiser, cruiser_coordinates)
          cruiser_not_placed = false
          puts "Cruiser has been placed."
          puts @player_board.render(true)
        else
          puts "Those are invalid coordinates. Please try again:"
          placement_attempts -= 1
        end

      end

      submarine_not_placed = true
      while submarine_not_placed && placement_attempts > 0 do

        puts "Enter the squares for the Submarine (2 spaces):"
        # submarine_coordinates = gets.chomp
        submarine_coordinates = 'C3 C4' # ** automatic placement for testing **
        submarine_coordinates = submarine_coordinates.split(" ")

        valid_coordinates = true
        submarine_coordinates.each do |coordinate|
          if !@player_board.valid_coordinate?(coordinate)
              valid_coordinates = false
          end
        end

        valid_placement = @player_board.valid_placement?(@player_submarine, submarine_coordinates)

        if valid_coordinates && valid_placement
          @player_board.place(@player_submarine, submarine_coordinates)
          submarine_not_placed = false
          ships_not_placed = false
          puts "Submarine has been placed."
          puts @player_board.render(true)
        else
          puts "Those are invalid coordinates. Please try again:"
          placement_attempts -= 1
        end

      end

      if placement_attempts == 0
        return puts "What are you doing here?"
      end

    end
    # play_game
  end


  def play_game
    remaining_coordinates_comp = @computer_board.cells.keys # moved outside of while loop
    remaining_coordinates_player = @player_board.cells.keys # moved outside of while loop

    while !@player_board.ships_sunk? && !@computer_board.ships_sunk? # while computer and player still have ships
      puts "=============COMPUTER BOARD============="
      puts @computer_board.render(true)
      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)

      player_taking_shot = true # bool variable for while loop
      player_shot = '' # added because player shot is referenced outside while loop, scope issue: consider using '@'
      while player_taking_shot # added while loop, prompt user until valid shot is taken
        puts "Enter the coordinate for your shot:"
        player_shot = gets.chomp

        valid_shot = @player_board.valid_coordinate?(player_shot) && remaining_coordinates_player.include?(player_shot)
        # User is informed when they have already fired on a coordinate
        # if the coordinate is valid but is not included in players remaining coordinates array, the shot has been taken already
        if @computer_board.cells.keys.include?(player_shot) && !remaining_coordinates_player.include?(player_shot)
          puts 'You have already fired on that coordinate.'
        elsif valid_shot
          @computer_board.cells[player_shot].fire_upon
          remaining_coordinates_player.delete(player_shot)
          player_taking_shot = false
        else
          puts "Please enter a valid coordinate:"
        end
      end

      computer_shot = remaining_coordinates_comp.sample
      @player_board.cells[computer_shot].fire_upon
      remaining_coordinates_comp.delete(computer_shot)

      player_shot_report = ''
      computer_shot_report = ''

      if @computer_board.cells[player_shot].render == 'M'
        player_shot_report = 'was a miss'
      elsif @computer_board.cells[player_shot].render == 'H'
        player_shot_report = 'was a hit'
      elsif @computer_board.cells[player_shot].render == 'X'
        player_shot_report = "sunk my #{@computer_board.cells[player_shot].ship.name}" # report name of sunk ship
      end

      if @player_board.cells[computer_shot].render == 'M'
        computer_shot_report = 'was a miss'
      elsif @player_board.cells[computer_shot].render == 'H'
        computer_shot_report = 'was a hit'
      elsif @player_board.cells[computer_shot].render == 'X'
        computer_shot_report = "sunk your #{@player_board.cells[computer_shot].ship.name}" # report name of sunk ship
      end

      puts "Your shot on #{player_shot} #{player_shot_report}."
      puts "My shot on #{computer_shot} #{computer_shot_report}."
    end
    if @player_board.ships_sunk?
      puts ''
      puts ''
      puts "I won!"
    elsif @computer_board.ships_sunk?
      puts "You won!"
    end
  end


end
