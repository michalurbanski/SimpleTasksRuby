module SimpleTasksRuby
  class Day
    attr_reader :name, :date, :tasks

    def initialize(name)
      @name = name
      @tasks = Array.new
      @date = extract_date_from_day_name(name)
    end

    def add_task(task)
      # TODO: Not a perfect solution (checking type of class) but a different handling would require Task and its hierarchy to be changed
      raise ArgumentError, "Only tasks can be added to days. You tried to add object of type: #{task.class}" unless task.is_a?(Task)

      @tasks.push(task)
    end

    def length
      @tasks.length
    end

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
