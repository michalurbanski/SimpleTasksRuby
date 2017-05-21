# Determines if line is a day line
module DaysParser
  def self.is_line_with_day(line)
    # Allowed days literals
    days = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

    pattern = build_regular_expression(days)
    pattern = /^#{pattern}/i
    line =~ pattern ? true : false
  end

  private
    def self.build_regular_expression(days)
      # TODO: check link http://stackoverflow.com/questions/2004688/create-regular-expression-from-string
      final_condition = "("

      days.each do |day|
        single_condition = day + "|"
        final_condition << single_condition
      end

      final_condition.chomp!("|")
      final_condition << ')(\s*\d{4}-\d{2}-\d{2}\s*)'

    end
end
