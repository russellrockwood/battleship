require './lib/ship'

class Cell
  attr_accessor :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship == nil ? true : false
  end

  def fire_upon
    @ship.health -= 1
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end
end
