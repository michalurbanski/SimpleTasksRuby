# Handles configuration entries
class ConfigurationService
  def initialize 
    @configuration = nil
  end

  # returns nil if value is not found
  def read_value(entry_type)
    read_file if @configuration.nil? # Read file only if it hasn't been read

    @configuration.configuration_values[entry_type]
  end

  private 
  def read_file
    @configuration = Configuration.new
    
  end
end
