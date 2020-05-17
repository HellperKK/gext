class SpriteTest < GextSprite
  set_common_sprite(GextPath.images("mouche.png"))
  def initialize(x=0, y=0, z=0)
    super(x, y, z)
    @speed = 100
  end

  def update(elapsed)
    @x += rand((-@speed)..@speed) * elapsed
    @y += rand((-@speed)..@speed) * elapsed
  end
end
