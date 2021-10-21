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

end
