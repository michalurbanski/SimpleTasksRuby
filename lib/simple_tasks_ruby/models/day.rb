class Day
  attr_reader :name, :actions, :date, :tasks

  def initialize(name)
    @name = name
    @actions = Array.new
    @date = extract_date_from_day_name(name)
  end

  # TODO: one of these methods have to be remove
  def add_action(text)
    @actions.push(text)
  end

  def add_tasks(tasks)
    @tasks = tasks
  end

  def to_s
    puts(@name)

    @actions.each do |action|
      puts(action)
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
    rescue => e # rescues StandardError
      raise IncorrectDateForDayException, name
    end
  end
end
