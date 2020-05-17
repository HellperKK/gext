require_relative "SpriteTest"

class SceneTest < GextScene
  def initialize
    super
    group = GextGroup.new
    100.times{group.add(SpriteTest.new(320, 240))}
    add(group)
  end

  def update(elapsed)
    super(elapsed)
    GextGame.close! if GextGame.keyboard.escape.just_pressed?
  end
end
