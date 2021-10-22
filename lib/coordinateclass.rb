require './lib/ship'
require './lib/cell'
require './lib/board'

class CoordinatesClass

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

  def consecutive_letters
    con_array = @letters.each_cons(2).to_a
    flag = true
    con_array.each do |arr|
      if arr[0] != arr[1] -1
        flag = false
      end
    end
    flag
  end

  def consecutive_nums
    con_array = @nums.each_cons(2).to_a
    flag = true
    con_array.each do |arr|
      if arr[0] != arr[1] -1
        flag = false
      end
    end
    flag
  end

  def same_letter
    @letters.uniq.size == 1
  end

  def same_num
    @nums.uniq.size == 1
  end

end
