class WeekConverter
  def initialize(lines)
    @lines = lines # all lines as input
  end

  def convert_lines_to_week
    @name = ""

    @lines.each do |line|
      if @name.empty? then
        extract_week_name(line)
      end

      # TODO; continue parsing other lines

    end
  end

  # overriden
  def to_s
    puts(@name)
  end

  private
    def extract_week_name(line)
      week_name_pattern = /^[Ww]eek/

      if line =~ week_name_pattern
        @name = line
      end
    end
end
