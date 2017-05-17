# module implementation based on http://stackoverflow.com/questions/917566/ruby-share-logger-instance-among-module-classes
module Logging
  def logger # this becomes instance method when module is included in class
    @logger ||= Logging.logger_for(self.class.name)
  end

  # Cache unique logger per class
  @loggers = {}
  
  class << self
    attr_accessor :is_logging_enabled
    attr_accessor :options

    def is_logging_enabled
      # result = @is_logging_enabled ||= true # or-equals operator does not work for bool values
      # https://allenan.com/ruby-or-equals-operator-default-booleans/
      # if @is_logging_enabled variable is not defined it will be set to true (note that nil value assigned means that variable is already defined)
      defined?(@is_logging_enabled) or @is_logging_enabled = true

      # in case if module is included in class - instance variables are nil when not initialized
      @is_logging_enabled = true if @is_logging_enabled.nil?

      @is_logging_enabled
    end

    def logger_for(classname)
      @loggers[classname] ||= configure_logger_for(classname)
    end

    def configure_logger_for(classname)
      logger = LoggerFactory.create_logger(options) 
      logger.progname = classname
      
      # Custom decorator over Logger class
      logger = LoggerDecorator.new(logger)
      logger.is_enabled = @is_logging_enabled
      
      logger
    end
  end
end
