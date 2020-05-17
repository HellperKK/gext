require_relative "SpriteTest"

class SceneTest < GextScene
  def initialize
    super
    player = SpriteTest.new(320, 240)
    add(player)
  end

  def update(elapsed)
    super(elapsed)
    GextGame.close! if GextGame.keyboard.escape.just_pressed?
  end
end
