# require './lib/gameplay'; Gameplay.new.start
# my_array = ("A"..90.chr).to_a
# keys = (1..26).to_a
# letters_hash = keys.zip(my_array).to_h
# p letters_hash
# def test(height, width)
#   letter_array = ('A'..'Z').to_a #
#   keys = (1..26).to_a #
#   letters_hash = keys.zip(letter_array).to_h #
#   # @cells = {}
#   for letter in ('A'..letters_hash[height])#height Z
#     for num in (1..width)
#       # @cells[letter + num.to_s] = Cell.new(letter + num.to_s)
#       puts letter + num.to_s
#     end
#   end
# end
# # min length for each inputs are 9 max lengths are 26
# test(4, 5)


x_axis = "   "#string we will concatenate to. each iteration
#concatenates a num need x axis number and set ot 1
@width = 5
x_axis_num = 1
while x_axis_num <= @width
  x_axis.concat( " " + x_axis_num.to_s)
  x_axis_num += 1
end
puts x_axis
