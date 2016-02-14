class Day
  attr_reader :name, :actions

  # TODO: you can't have two constructors in ruby?
  #def initialize(name, actions)
  #  @name = name
  #  @actions = actions
  #end

  def initialize(name)
    @name = name
    @actions = Array.new
  end

  def add_action(text)
    @actions.push(text)
    puts("Adding acton #{text}")
  end

  def print_day
    puts(@name)
    @actions.each do |action|
      puts(action)
    end
  end
end
