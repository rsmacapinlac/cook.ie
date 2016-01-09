require 'cookie_cutter/version'
require 'cookie_cutter/oven'
require 'log4r'

include Log4r

# create a logger named 'mylog' that logs to stdout
# mylog = Logger.new 'mylog'
# mylog.outputters = Outputter.stdout

module CookieCutter

  class << self
    attr_writer :logger

    def logger
      if @logger.nil?
        @logger = Logger.new(self.name)
        @logger.outputters = Outputter.stdout
      end
      @logger

    end
  end

end
