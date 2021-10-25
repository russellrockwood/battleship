require './lib/ship'
require './lib/cell'
require './lib/coordinateclass'


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

    coordinates.each do |coordinate|
      if !valid_coordinate?(coordinate)
        return false
      end
    end

    if ship.length != coordinates.length
      return false
    end
    coordinates_open = true
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
    if (coordinate_checker.consecutive_nums && coordinate_checker.same_letter) || (coordinate_checker.consecutive_letters && coordinate_checker.same_num)
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

  def render(input=false)
    puts "   1 2 3 4 "

    cells_array = @cells.values

    render_array = []
    cells_array.each do |cell|
      render_array << cell.render(input)
    end

    i = 0
    ord = 65
    @cells.each do |element| #element/item
      if i > @cells.length - 4
        break
      end
      puts ' ' + ord.chr + ' ' + render_array[i] + ' ' + render_array[i+1] + ' ' + render_array[i+2] + ' ' + render_array[i+3]
      i += 4
      ord += 1
    end
  end

  def ships_sunk?
    cells_array = @cells.values

    # floating_ship = true
    cells_array.each do |cell|
      if !cell.empty?
        if !cell.ship.sunk?
            return false  #floating_ship
        end

      end
    end
    return true
    #we need to iterate through all cells
    # and we need to check if each cell contains a ship with health above 0
    #if at any point we reach a floating ship, retrun false
  end

end
