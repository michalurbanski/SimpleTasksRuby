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

  def print_day
    puts(@name)
    @actions.each do |action|
      puts(action)
    end
  end

  def add_tasks(tasks)
    @tasks = tasks
  end

  private
  def extract_date_from_day_name(name)
    splitted = name.split
    if splitted.length < 2
      raise NoDateException, "Day must have date provided"
    end

    datePart = name.split[1]
    @date = Date.strptime(datePart, '%Y-%m-%d') # TODO: move to module as date format
  end
end
