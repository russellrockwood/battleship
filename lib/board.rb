require './lib/ship'
require './lib/cell'
require './lib/coordinateclass'


class Board

  attr_accessor :cells, :height, :width
  # two optional parameters(height, width) for initialize to indicate board board size
  def initialize(height, width)
    @height = height
    @width = width
    letter_array = ('A'..'Z').to_a #
    keys = (1..26).to_a #
    letters_hash = keys.zip(letter_array).to_h #
    @cells = {}
    for letter in ('A'..letters_hash[height])#height Z
      for num in (1..width)
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
    x_axis = " "
    x_axis_num = 1
    while x_axis_num <= @width
      x_axis.concat( " " + x_axis_num.to_s)
      x_axis_num += 1
    end
    puts x_axis

    cells_array = @cells.values

    render_array = []
    cells_array.each do |cell|
      render_array << cell.render(input)
    end

    sliced_array = render_array.each_slice(@width).to_a

    ord = 65
    sliced_array.each do |row|
      puts ord.chr + ' ' + row.join(' ')
      ord += 1
    end
  end

  def ships_sunk?
    cells_array = @cells.values


    cells_array.each do |cell|
      if !cell.empty?
        if !cell.ship.sunk?
            return false
        end

      end
    end
    return true
  end

end
