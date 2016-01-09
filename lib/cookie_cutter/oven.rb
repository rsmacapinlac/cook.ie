require 'erb'
require 'yaml'

module CookieCutter
  class Oven
    include ERB::Util
    attr_accessor :template, :output_name, :output_ext, :date
    attr_accessor :_config, :_template_type

    def initialize(template_type, output_name, template_dir=ENV['CC_TEMPLATE_DIR'])

      log __method__, "Loading config file..."

      @_config = YAML::load_file(File.join(template_dir, 'config.yml'))
      @_template_type = template_type
      @output_name = output_name

      unless @_config[@_template_type].nil?
        log __method__, "Template:         #{@_template_type}"
        log __method__, "Template details: #{@_config[@_template_type]}"
        @template = File.join(template_dir, @_config[@_template_type]['template'])
        @output_ext = get_output_file_ext(@_config[@_template_type]['template'])
      end
    end

    def render()
      ERB.new(File.open(@template).read).result(binding)
      log __method__, "Rendering cookie"
    end

    def save()
      output_full_path = File.join(@_config[@_template_type]['output_dir'], "#{@output_name}.#{@output_ext}")

      f = File.open(output_full_path, 'w+')
      f.write(render)

      log __method__, "Saving cookie to: #{output_full_path}"
    end

    private

    def log(method_name, msg)
      CookieCutter.logger.info "#{self.class.name}.#{method_name}: #{msg}"
    end

    def get_output_file_ext(template_file)
      # assume: filename.ext.erb
      # return 'ext'
      # (\w+)\.(\w+)(.erb)
      template_file[/(\w+)\.(\w+)(.erb)/, 2].strip
    end
  end
end
