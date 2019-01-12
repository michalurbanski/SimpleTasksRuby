module SimpleTasksRuby
  ##
  # Day is a container for tasks. Days are stored inside a Week container.
  #
  # Tasks inside a day are stored in Array.

  class Day
    attr_reader :name, :date, :tasks

    ##
    # Creates a new Day object.
    #
    # == Parameters:
    # name::
    #   Line read from input file. For a correct day this line consists of
    #   a day of the week and a date, like:
    #     Monday 2019-01-14

    def initialize(name)
      @name = name
      @tasks = Array.new
      @date = extract_date_from_day_name(name)
    end

    ##
    # Adds task to a day.
    # 
    # == Parameters:
    # [task] object of a Task class or any of the derived classes
    #
    # @param task [Task] object of a Task class or any of the derived classes.

    def add_task(task)
      # TODO: Not a perfect solution (checking type of class) but a different handling would require Task and its hierarchy to be changed
      raise ArgumentError, "Only tasks can be added to days. You tried to add object of type: #{task.class}" unless task.is_a?(Task)

      @tasks.push(task)
    end

    ##
    # @return [Numeric] Number of tasks in a day.

    def length
      @tasks.length
    end

    ##
    # Helper method to print out all the tasks in a day.

    def to_s
      puts(@name)

      @tasks.each do |task|
        puts(task)
      end
    end

    private
      def extract_date_from_day_name(name)
        splitted = name.split
        if splitted.length < 2
          raise NoDateException, name
        end

        datePart = name.split[1]

        begin
          @date = Date.strptime(datePart, DateConsts.day_format)
        rescue # rescues StandardError
          raise IncorrectDateForDayException, name
        end
      end
  end
end
