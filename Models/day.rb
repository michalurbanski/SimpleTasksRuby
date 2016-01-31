class Day
  def intialize(name, actions)
    @name = name
    @actions = actions
  end

  # overriden
  def to_s
    puts(@name)
    @actions.each do |action|
      puts(action)
    end
  end
end
