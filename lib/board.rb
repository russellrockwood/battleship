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
    x_axis = "  "
    x_axis_num = 1
    while x_axis_num <= @width
      x_axis.concat( " " + x_axis_num.to_s)
      x_axis_num += 1
    end
    puts x_axis

    cells_array = @cells.values

    render_array = []
    cells_array.each do |cell|
      render_array << cell.render
    end

    render_array = render_array.each_slice(@width).to_a

    render_array.each do |row|
      row.each
    end

    ord = 65
    render_array.each do |row|
      rendered_row = ''
      row.each do |render_item|
        rendered_row.concat(render_item.to_s + ' ')
      end
      puts ' ' + ord.chr + ' ' + rendered_row
      ord += 1
    end

    # i = 0
    # ord = 65
    # @cells.each do |element|
    #   if i > @cells.length - 4
    #     break
    #   end
    #   puts ' ' + ord.chr + ' ' + render_array[i] + ' ' + render_array[i+1] + ' ' + render_array[i+2] + ' ' + render_array[i+3]
    #   i += 4
    #   ord += 1
    # end
  end

  def ships_sunk?
    cells_array = @cells.values#blah blah


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
