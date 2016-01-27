class Main
  def start
    puts("Welcome to Simple Tasks Project")
  end

  def clear_screen
    system "clear" or system "cls"
  end

  def end
    puts("Program execution finished".colorize(:green))
  end
end
