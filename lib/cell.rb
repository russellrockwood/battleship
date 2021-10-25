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
    if !@ship.empty?
      @ship.hit
    end
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end
# put optional argument
  def render(input=false)
    rendered_char = '.'
    if input && !@fired_upon && !empty?
      rendered_char = 'S'
    elsif @fired_upon && empty? # && !self.ship.sunk?
        rendered_char = 'M'
    elsif self.ship != nil
      if @fired_upon && !empty? && self.ship.sunk?
        rendered_char = 'X'
      elsif @fired_upon && !empty? && !self.ship.sunk?
        rendered_char = 'H'
      end
    else
      rendered_char = '.'
    end
    return rendered_char
  end
end
