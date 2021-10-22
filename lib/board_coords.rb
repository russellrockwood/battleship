class BoardCoords

  attr_accessor :coordinates, :nums, :letters

  def initialize(coordinates)
    @coordinates = coordinates
    @letters = []
    @nums = []

  end

  def sort_elements
    split_coordinates = @coordinates.map do |coordinate|
      coordinate.chars
    end

    split_coordinates.each do |array|
      @letters << array[0].ord
      @nums << array[1].to_i
    end

    @nums = @nums.sort
    @letters = @letters.sort
  end

  def valid_letters?
    # letter_flag = true
    con_array = letters.each_cons(2).to_a
    con_array.each do |arr|
      if arr[0] != arr[1] -1
        false #flag = false previously
      end
    end
    true
  end

  def valid_nums?

  end

end
