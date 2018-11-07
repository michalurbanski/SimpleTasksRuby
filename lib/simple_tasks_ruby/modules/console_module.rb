module SimpleTasksRuby
  module ConsoleModule
    def self.clear_screen
      system 'clear' or system 'cls'
    end
  end
end
