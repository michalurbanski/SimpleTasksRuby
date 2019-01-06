module SimpleTasksRuby
  class Task
    attr_reader :title
    attr_reader :original_date

    def initialize(title, original_date, properties = {})
      @title = title
      @original_date = original_date
      @properties = properties
    end

    def to_s
      "#{@original_date} - #{@title}"
    end

    def status
      @properties[:status]
    end

    def done_date
      @properties[:done_date] # if not filled then returns nil
    end
  end
end
