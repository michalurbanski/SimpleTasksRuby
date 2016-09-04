# module implementation based on http://stackoverflow.com/questions/917566/ruby-share-logger-instance-among-module-classes
module Logging
  def logger
    @logger ||= Logging.logger_for(self.class.name)
  end

  # Cache unique logger per class
  @loggers = {}

  class << self
    def logger_for(classname)
      @loggers[classname] ||= configure_logger_for(classname)
    end

    def configure_logger_for(classname)
      logger = Logger.new(STDOUT)
      logger.progname = classname
      logger
    end
  end
end
