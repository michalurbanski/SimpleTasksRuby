# Decorates logger class - to be able to enable/disable logging on request
class LoggerDecorator
  attr_accessor :is_enabled
  
  def is_enabled
    @is_enabled = true if @is_enabled.nil?
    
    @is_enabled
  end

  def initialize(logger)
    @logger = logger
  end

  def info(message)
    @logger.info(message) if is_enabled
  end
end
