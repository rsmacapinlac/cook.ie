require 'cookie_cutter/version'
require 'cookie_cutter/recipe'
require 'cookie_cutter/cookie'
require 'cookie_cutter/oven'

require 'log4r'

include Log4r

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
