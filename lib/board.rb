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

    coordinate_checker = CoordinatesClass.new(coordinates)
    coordinate_checker.sort_elements
    if coordinate_checker.consecutive_nums && coordinate_checker.same_letter || coordinate_checker.consecutive_letters && coordinate_checker.same_num
      return true
    end
  end
    #we need to sort first
    #numbers must be consecutive or letters must be consecutive. BOTH CANNOT be consecutive.
    #if letters are consecutive, then number must remain the same. EX: A1, B1, C1
    #if numbers are consecutive, then letters must remain the same. EX: A1, A2, A3
    #for cruiser, numbers can only be [1,2,3] [2,3,4] or a variation
    #for sub, letters can only be     [A,B,C] [B,C,D]
    #for sub, numbers can only be [1,2][2,3] [3,4] or a variation
    #for sub, letters can only be [A,B][B,C][C,D]

#if we have a hash or array that contains all valid moves, the we can do an .any? to the
#coordinates that are passsed in. for example [A1, A2, A3] [A2,A3,A4] are the only
#valid for top line. (coordinates).any? to include the has of acceptable answers.





end
