require 'spec_helper'

module SimpleTasksRuby
  describe Day do
    subject { day } # sets accessor called subject to day variable

    describe "Day tests" do
      # http://chriskottom.com/blog/2014/10/4-fantastic-ways-to-set-up-state-in-minitest/
      # Each let invocation defines a new method with the specified name that executes the block argument upon the first invocation and caches the result for later access - in other words, a lazy initializer. 
      let(:date) {"2016-05-01"}
      let(:line) {"Monday " + date}
      let(:day) { Day.new(line) }

      it "Created day has a name" do
        subject.name.must_equal line
      end

      it "Day has proper date" do
        subject.date.must_equal Date.parse(date)
      end

      it "Day has no tasks when created" do
        subject.length.must_equal 0
      end

      it "Day allows adding new tasks" do
        task = Task.new("Title", Date.new(2016, 1,1))
        subject.add_task(task)

        subject.length.must_equal 1
      end
    end

    describe "Day incorrect data" do
      it "Day not initialized with date can't be created" do
        lambda {
          Day.new("Monday")
        }.must_raise NoDateException
      end

      it "Day initialized with not correct date can't be created - error contains information about this date" do
        day_with_incorrect_date = "Monday 2016-05-44"
        
        err = lambda {
          Day.new(day_with_incorrect_date)
        }.must_raise IncorrectDateForDayException
        
        err.message.include?(day_with_incorrect_date).must_equal true
      end

      it "Day can have only tasks instances added" do
        day = Day.new("Monday 2016-05-01")

        lambda{
          day.add_task("test")
        }.must_raise ArgumentError
      end
    end
  end
end
