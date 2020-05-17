require "gosu"
require_relative "InputManager"

class GextGame < Gosu::Window
  class << self
    attr_reader :scene, :keyboard, :mouse, :gamepad, :screen_with, :screen_heigh
    @@scene = nil
    @window = nil
    def begin(scene, title, width=640, heigh=480, fulscreen=false)
      unless @window
        @window = self.new(title, width, heigh, fulscreen)
        @keyboard = InputManager.new(/KB_(.+)/)
        @mouse = InputManager.new(/MS_(.+)/)
        @gamepad = InputManager.new(/GP_(.+)/)

        @screen_with = width
        @screen_heigh = heigh

        @@scene = scene

        @window.show
      end
    end

    def changeScene(scene)
      @@scene = scene
    end

    def add_button_down(key)
      found = false
      [@keyboard, @mouse, @gamepad].each do |manager|
        item = manager.find_by_value(key)
        if item
          item.mark_just_pressed
          @window.input_save << item
          found = true
          break
        end
      end
      raise "this key isn't impremented #{key}" unless found
    end

    def add_button_up(key)
      found = false
      [@keyboard, @mouse, @gamepad].each do |manager|
        item = manager.find_by_value(key)
        if item
          item.mark_just_released
          @window.input_save << item
          found = true
          break
        end
      end
      raise "this key isn't impremented #{key}" unless found
    end

    def close!
      @window.close!
    end

    def set_button_pressed(lambda)

    end

  end

  attr_reader :input_save

  def initialize(title, width, heigh, fulscreen)
    super(width, heigh, fulscreen)
    @input_save = []
    self.caption = title
  end

  def update
    @@scene.update(self.update_interval / 1000)
    @input_save.each{|input| input.clear}
    @input_save = []
  end

  def draw
    @@scene.draw
  end

  def button_down(key)
    self.class.add_button_down(key)
  end

  def button_up(key)
    self.class.add_button_up(key)
  end
end
