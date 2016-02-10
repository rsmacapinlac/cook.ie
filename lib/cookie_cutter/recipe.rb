module CookieCutter
  class Cookie
    attr_accessor :name
    def initializer(name)
      @name = name
    end
  end

  class Recipe
    DEFAULT_CONFIG_FILENAME = 'config.yml'

    def initialize(config_file_path = nil)
      throw ArgumentError if config_file_path.nil?

      @_config = Recipe.read_config_file(config_file_path)
    end

    def config
      @_config
    end
    def template
      @_template
    end

    def dough(template_name, name)
      @_template = self.config[template_name]
    end

    private

    def self.config_is_dir(config_path)
      path = File.expand_path(config_path)
      File.directory? path
    end

    def self.read_config_file(template_path)
      if Recipe.config_is_dir(template_path) == true
        full_path = File.expand_path File.join(template_path, Recipe::DEFAULT_CONFIG_FILENAME)
      else
        full_path = File.expand_path File.join(template_path)
      end
      return YAML::load_file(full_path)
    end
  end
end
