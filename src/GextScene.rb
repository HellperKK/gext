require "gosu"

class GextScene
  def initialize
    @sprites = []
  end

  def update(elapsed)
    @sprites.each{|sprite| sprite.update(elapsed)}
  end

  def draw
    @sprites.each{|sprite| sprite.draw}
  end

  def add(sprite)
    @sprites << sprite
  end
end
