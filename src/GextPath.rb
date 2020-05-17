module GextPath
  class << self
    def register_path(key, path)
      @path_list = Hash.new unless @path_list
      @path_list[key.to_sym] = path
    end
    def all_from(key)
      Dir["#{@path_list[key]}/**"]
    end
    def method_missing(name, *args, &bloc)
      if @path_list.include?(name.to_sym)
        "#{@path_list[name.to_sym]}/#{args[0]}"
      else
        super(name, *args, &bloc)
      end
    end
  end
end
