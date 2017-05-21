require 'yaml'

# Handles configuration entries
class ConfigurationService

  # returns nil if value is not found
  def read_value(entry_type)
    read_file if @configuration.nil? # Read file only if it hasn't been read

    @configuration.configuration_values[entry_type]
  end

  private 
    def read_file
      @configuration = Configuration.new

      path = File.expand_path("../../../../config.yaml", __FILE__)
      @configuration.configuration_values = YAML::load_file(path)
    end
end
