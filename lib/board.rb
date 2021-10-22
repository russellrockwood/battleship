require './lib/ship'
require './lib/cell'

class Board

  attr_accessor :cells
  # a
  def initialize
    # @cells = {"A1" => Cell.new("A1")}
    @cells = {}
    for letter in ('A'..'D')
      for num in (1..4)
        # puts letter + num.to_s
        @cells[letter + num.to_s] = Cell.new(letter + num.to_s)
      end
    end
  end

  def valid_coordinate?(coordinate)
    @cells[coordinate] == nil ? false : true
  end

  def valid_placement?(ship, coordinates)
    if ship.length != coordinates.length
       return false
    end
    #we need to sort first
    #numbers must be consecutive or letters must be consecutive. BOTH CANNOT be consecutive.
    # split_coordinates = coordinates.map do |coordinate|
    #    coordinate.chars
    # end
    # letters = []
    # nums = []
    # split_coordinates.each do |array|
    #   letters << array[0].ord
    #   nums << array[1].to_i
    # end
    # nums = nums.sort
    # letters = letters.sort



  end



end
