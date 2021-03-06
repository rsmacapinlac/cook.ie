require 'pathname'
require 'erb'

module CookieCutter
  # builds a text file with specified parameters
  # A cookie knows:
  # * it's name
  # * where to save itself
  class Cookie
    attr_accessor :name, :output
    attr_accessor :overwrite, :template_options

    # constants
    OUTPUT_DIR = 'output_dir'
    TEMPLATE_NAME = 'template'
    CONFIG_PATH = 'config_path'

    def initialize(name, template_options = {})
      # defaults
      @overwrite = true
      @name = name
      @output = {}
      @output[:name] = name
      @template_options = template_options
    end

    def assemble
      _template_path = File.open(self.template_path).read
      output = ERB.new(_template_path).result(binding)
      return output
    end

    def save
      template_output = self.assemble
      save_path = File.join(self.where_to_save, "#{@name}.txt")
      f = File.open(save_path, 'w+')
      f.write(template_output)
    end

    # assumption, all templates will be kept in the config directory
    def template_path
      path = File.expand_path File.join(@template_options[CONFIG_PATH], @template_options[TEMPLATE_NAME])
      # TODO fix and throw some sort of cool exception
      if !File.exists? path
        path = nil
      end
      return path
    end

    # if the output dir is relative, then assume relative to the current folder
    # otherwise absolute
    def where_to_save
      output_dir = @template_options[OUTPUT_DIR]
      # assume absolute
      full_path = output_dir
      if (Pathname.new(output_dir)).relative?
        full_path = File.expand_path(output_dir, Dir.pwd)
      end
      return full_path
    end
  end
end
