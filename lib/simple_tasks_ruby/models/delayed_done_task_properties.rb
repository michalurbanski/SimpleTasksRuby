module SimpleTasksRuby
  class DelayedDoneTaskProperties
    attr_reader :done_date

    def initialize(done_date)
      @done_date = done_date
    end

    def status
      SimpleTasksRuby::TaskType::DELAYED_DONE
    end
  end
end
