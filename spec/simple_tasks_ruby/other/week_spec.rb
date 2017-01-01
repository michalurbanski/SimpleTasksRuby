require 'spec_helper'

describe Week do
  describe "Correct week structures" do
    before do
      @name = "Week 1"
    end

    it "Week can have name" do
      week = Week.new(@name)

      week.name.must_equal @name
    end

    it "Week can have days" do
      week = Week.new(@name)

      week.add_day(1)

      week.days.length.must_equal 1
    end

    it "By default not initialized week has undefined title" do
      week = Week.new

      week.name.must_equal "undefined"
    end
  end
end
