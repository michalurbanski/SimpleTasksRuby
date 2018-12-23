require 'spec_helper'

module SimpleTasksRuby
  describe PossibleDaysTester do
    subject{ possible_days_tester }
    let(:possible_days_tester) { PossibleDaysTester.new }
    
    describe "Possible days" do
      {
        "Monday" => true,
        "mONday" => true,
        "aaa"    => false,
        ""       => false,
        nil      => false
      }.each do |day_name, is_valid|
        it "Check if name of the day is valid" do
          subject.is_day(day_name).must_equal is_valid
        end
      end
    end
  end
end
