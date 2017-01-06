class Day
  attr_reader :name, :actions, :date, :tasks

  # TODO: you can't have two constructors in ruby?
  #def initialize(name, actions)
  #  @name = name
  #  @actions = actions
  #end

  def initialize(name)
    @name = name
    @actions = Array.new
    @date = extract_date_from_day_name(name)
  end

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
      raise NoDateException
    end

    datePart = name.split[1]

    begin
      @date = Date.strptime(datePart, '%Y-%m-%d') # TODO: move to module as date format
    rescue Exception => e
      raise IncorrectDateForDayException.new(name)
    end
  end
end
