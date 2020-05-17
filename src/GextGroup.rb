class GextGroup
  def initialize
    @elements = []
  end

  def add(sprite)
    @elements << sprite
  end

  def update(elapsed)
    @elements.each{|elem| elem.update(elapsed)}
  end

  def draw
    @elements.each{|elem| elem.draw}
  end
end
