class LoggerFactory 

  class << self
    def create_logger(options = {}) 
        unless options.nil? 
          return Logger.new(options[:name]) if options[:type] == :file
        end

        Logger.new(STDOUT) 
    end
  end
end
