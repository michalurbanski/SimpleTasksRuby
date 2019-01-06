module SimpleTasksRuby
  class NoDateException < StandardError
    def initialize(text="default day")
      @text = text
    end

    def to_s
      puts "Day \"#{@text}\" must have date provided"
    end
  end
end
