class Cell
  attr_accessor :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    # @ship = nil
  end

  def ship(ship=nil)
    @ship = ship
  end
end
