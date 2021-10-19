class Ship
  attr_accessor :name, :length

  def initialize(name, length)
    @name = name
    @length = length
    # @health = @length
  end

  def health

    health = @length
  end

  def sunk?
    if health > 0
      "false"
    else
      "true"
    end

  end

  def hit
    @length -= 1
  end

end
