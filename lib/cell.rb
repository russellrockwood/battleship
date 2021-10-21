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
    if !self.empty?
      @ship.health -= 1
    end
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end
# put optional argument
  def render
    if !self.empty? && self.ship.sunk?
      return 'X'
    end
    if self.empty? && self.fired_upon
      return 'M'
    end
    if !self.empty? && self.fired_upon
      return 'H'
    end
    '.'
  end
end
