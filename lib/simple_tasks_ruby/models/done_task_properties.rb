module SimpleTasksRuby
  # DoneTask is done at the same day as it was scheduled.
  class DoneTaskProperties
    def status
      SimpleTasksRuby::TaskType::DONE
    end
  end
end
