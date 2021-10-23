require './lib/ship'
require './lib/cell'


class Board

  attr_accessor :cells

  def initialize
    @cells = {}
    for letter in ('A'..'D')
      for num in (1..4)
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
    coordinates_open = true
#change method to get proper return value.
    coordinates.each do |coordinate|
      if @cells[coordinate].ship != nil
        coordinates_open = false
      end
    end
    if !coordinates_open
      return false
    end

    coordinate_checker = CoordinatesClass.new(coordinates)
    coordinate_checker.sort_elements
    if coordinate_checker.consecutive_nums && coordinate_checker.same_letter || coordinate_checker.consecutive_letters && coordinate_checker.same_num
      return true
    end

    false
  end

  def place(ship, coordinates)

    coordinates.each do |coordinate|
      cell = @cells[coordinate]
      cell.place_ship(ship)
    end
  end

  def render

  end
end
