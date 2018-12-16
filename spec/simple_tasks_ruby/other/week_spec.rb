require 'spec_helper'

module SimpleTasksRuby
  describe Week do
    let(:week_name) { "Week 1"}
    let(:week) { Week.new(week_name) }
    subject { week }
    
    it "Week can have name" do
      subject.name.must_equal week_name
    end

    it "Week can have days" do
      subject.add_day(DayFactory.create_valid_day())

      subject.length.must_equal 1
    end

    it "Week exposes tasks" do
      subject.add_day(DayFactory.create_valid_day())
      
      subject.tasks.length.must_equal 1
    end

    it "Week exposes tasks from multiple days" do
      subject.add_day(DayFactory.create_valid_day())
      subject.add_day(DayFactory.create_valid_day())
      
      subject.tasks.length.must_equal 2
    end

    it "Week exposes tasks from multiple days and some days have no tasks" do
      subject.add_day(DayFactory.create_valid_day())
      subject.add_day(DayFactory.create_valid_day())
      subject.add_day(DayFactory.create_empty_day())

      subject.tasks.length.must_equal 2
    end

    it "By default not initialized week has undefined title" do
      week = Week.new

      week.name.must_equal "undefined"
    end

    it "Valid week has 7 days" do
      days = (1..7).to_a

      days.each do |day|
        subject.add_day(day)
      end

      subject.is_valid.must_equal true
      subject.length.must_equal 7
    end

    it "Invalid week can have less or more than 7 days" do
      days = (1..10).to_a

      days.each do |day|
        subject.add_day(day)
      end

      subject.is_valid.must_equal false
      subject.length.must_equal 10
    end
  end
end
