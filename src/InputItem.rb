class InputItem
  attr_reader :value

  class << self
    @button_pressed = nil

    def button_pressed(lambda)

    end
  end

  def initialize(value)
    @value = value
    @just_pressed = false
    @just_released = false
  end

  def has_key(key)
    @key == key
  end

  def has_value(value)
    @value == value
  end

  def mark_just_pressed
    @just_pressed = true
  end

  def mark_just_released
    @just_released = true
  end

  def just_pressed?
    @just_pressed
  end

  def pressed?
    # @button_pressed.call(@value)
    Gosu::button_down?(@value)
  end

  def just_released?
    @just_released
  end

  def clear
    @just_pressed = false
    @just_released = false
  end
end
