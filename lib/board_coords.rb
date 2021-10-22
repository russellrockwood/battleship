class BoardCoords

  attr_accessor :coordinates

  def initialize(coordinates)
    @coordinates = coordinates

  end

  def sort_elements
    split_coordinates = @coordinates.map do |coordinate|
      coordinate.chars
    end
    letters = []
    nums = []
    split_coordinates.each do |array|
      letters << array[0].ord
      nums << array[1].to_i
    end

    nums = nums.sort
    letters = letters.sort
  end

end
