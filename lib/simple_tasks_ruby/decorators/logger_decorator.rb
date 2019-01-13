module SimpleTasksRuby
  ##
  # Decorates Ruby's logger. Introduces functionality to disable logging dynamically.
  # Useful feature for tests' execution.
  
  class LoggerDecorator
    attr_writer :is_enabled
    
    def is_enabled
      @is_enabled = true if @is_enabled.nil?
      
      return @is_enabled
    end

    def initialize(logger)
      @logger = logger
    end

    def info(message)
      @logger.info(message) if is_enabled
    end

    def error(message)
      @logger.error(message) if is_enabled
    end
  end
end
