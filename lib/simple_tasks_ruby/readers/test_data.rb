module SimpleTasksRuby
  class TestData
    SAMPLES_PATH = "../../../samples"
    
    class << self
      def single_week_path
        get_file("single_week.txt")
      end
  
      def multiple_weeks_path
        get_file("multiple_weeks.txt")
      end

      private
        def get_file(filename)
          File.expand_path("#{SAMPLES_PATH}/#{filename}", __FILE__)
        end
    end
  end
end
