require 'erb'
require 'yaml'

module CookieCutter
  class Oven
    include ERB::Util
    attr_accessor :template, :output_name, :output_ext, :date
    attr_accessor :_config, :_template_type

    def initialize(template_type, output_name, template_dir=ENV['CC_TEMPLATE_DIR'])
      @_config = YAML::load_file(File.join(template_dir, 'config.yml'))
      @_template_type = template_type
      @output_name = output_name

      puts @_config
      @template = File.join(template_dir, @_config[@_template_type]['template'])
      @output_ext = get_output_file_ext(@_config[@_template_type]['template'])
    end

    def render()
      ERB.new(File.open(@template).read).result(binding)
    end

    def save()
      output_full_path = File.join(@_config[@_template_type]['output_dir'], "#{@output_name}.#{@output_ext}")

      f = File.open(output_full_path, 'w+')
      f.write(render)
    end

    private

    def get_output_file_ext(template_file)
      # assume: filename.ext.erb
      # return 'ext'
      # (\w+)\.(\w+)(.erb)
      template_file[/(\w+)\.(\w+)(.erb)/, 2].strip
    end
  end
end
