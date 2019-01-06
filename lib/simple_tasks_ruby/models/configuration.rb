module SimpleTasksRuby
  class Configuration
    attr_writer :configuration_values # hash with values

    def configuration_values
      @configuration_values ||= Hash.new
    end
  end
end
