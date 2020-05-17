class SpriteTest < GextSprite
  set_common_sprite(GextPath.images("mouche.png"))
  def initialize(x=0, y=0, z=0)
    super(x, y, z)
    @speed = 100
  end

  def update(elapsed)
    @x -= 1 if GextGame.keyboard.left.pressed?
    @x += 1 if GextGame.keyboard.right.pressed?
    @y -= 1 if GextGame.keyboard.up.pressed?
    @y += 1 if GextGame.keyboard.down.pressed?
  end
end
