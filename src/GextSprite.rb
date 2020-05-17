class GextSprite
  @@common_sprite = nil
  class << self
    def set_common_sprite(name)
      @@common_sprite = Gosu::Image.new(name)
    end
  end

  def initialize(x=0, y=0, z=0)
    @x = x
    @y = y
    @z = z
    @sprite = nil
  end

  def load_sprite(name)
    @sprite = Gosu::Image.new(name)
  end

  def update(elapsed)

  end

  def draw
    if @sprite
      @sprite.draw(@x, @y, @z)
    elsif @@common_sprite
      @@common_sprite.draw(@x, @y, @z)
    else
      raise "no sprite to draw"
    end
  end
end
