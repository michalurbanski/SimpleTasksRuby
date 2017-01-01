require 'spec_helper'

describe Week do
  describe "Week" do
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

      week.length.must_equal 1
    end

    it "By default not initialized week has undefined title" do
      week = Week.new

      week.name.must_equal "undefined"
    end

    it "Valid week has 7 days" do
      week = Week.new(@name)
      days = (1..7).to_a

      days.each do |day|
        week.add_day(day)
      end

      week.is_valid.must_equal true
      week.length.must_equal 7
    end

    it "Invalid week can have less or more than 7 days" do
      week = Week.new(@name)
      days = (1..10).to_a

      days.each do |day|
        week.add_day(day)
      end

      week.is_valid.must_equal false
      week.length.must_equal 10
    end
  end
end
