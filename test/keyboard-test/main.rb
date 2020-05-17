require "gosu"
require_relative "../../src/GextPath"
GextPath.register_path(:images, "assets/images")
GextPath.register_path(:src, "../../src")
GextPath.all_from(:src).each do |file|
  puts file
  require_relative file
end
require_relative "SceneTest"

GextGame.begin(SceneTest.new, "test keyboard")
