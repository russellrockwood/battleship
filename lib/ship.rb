# Added health to attr_accessor & initialize method
# Removed health method
# Altered 'hit' method to decrement from health
class Ship
  attr_accessor :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = @length 
  end

  # def health
  #
  #   health = @length
  # end

  def sunk?
    if health > 0
      "false"
    else
      "true"
    end

  end

  def hit
    # @length -= 1
    @health -= 1
  end

end
