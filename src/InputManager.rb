require "gosu"
require_relative "InputItem"

class InputManager
  attr_reader :keys

  def [](key)
    @keys[key]
  end

  def find_by_value(value)
    @keys.each_value do |v|
      return v if v.has_value(value)
    end
    return nil
  end

  def each(&bloc)
    @keys.each(&bloc)
  end

  def initialize(regexp)
    @keys = Hash.new
    Gosu.constants.select{|name| regexp.match?(name.to_s)}.each do |name|
      new_name = regexp.match(name)[1].downcase.to_sym
      @keys[new_name] = InputItem.new(Gosu.const_get(name))
    end
  end

  def include?(key)
    @keys.include?(key)
  end

  def method_missing(name, *args, &bloc)
    if @keys.include?(name)
      @keys[name]
    else
      super(name, *args, &bloc)
    end
  end
end
