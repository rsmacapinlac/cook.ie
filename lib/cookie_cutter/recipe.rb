module CookieCutter
  # Reads config file information and builds a cookie from the selected template
  class Recipe
    DEFAULT_CONFIG_FILENAME = 'config.yml'
    attr_accessor :cookie, :config_file_path

    CONFIG_PATH = 'config_path'

    def initialize(config_file_path = nil)
      throw ArgumentError if config_file_path.nil?

      @config_file_path = config_file_path
      @_config = Recipe.read_config_file(config_file_path)
    end

    def config
      @_config
    end

    def template
      @_template[Recipe::CONFIG_PATH] = @config_file_path
      @_template
    end

    def build_cookie(cookie_name, which_template)
      @_template = self.config[which_template]
      @cookie = Cookie.new(cookie_name, self.template)
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
