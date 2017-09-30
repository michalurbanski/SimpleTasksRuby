require 'spec_helper'

# NOTE: If any module needs to be included, it has to be included before describe (not inside it).
include SimpleTasksRuby::TaskType

describe Task do
  subject { task }

  let(:date) { Date.new(2016, 1, 1) }
  let(:title) { "- this is task" }
  
  describe "Base task" do
    let(:task) { Task.new(title, date) } 

    it "When base task is created it has date and title" do
      subject.title.wont_be_nil
      subject.title.must_equal title
      subject.original_date.must_equal date
    end

    it "Base task has no additional properties" do 
      subject.status.must_be_nil
      subject.done_date.must_be_nil
    end
  end

  describe "Done task" do
    let(:task) do 
      Task.new(title, date, { status: DONE })
    end

    it "Done task has status set" do 
      subject.status.must_equal DONE
      subject.done_date.must_be_nil
    end
  end

  describe "Delayed and then done task" do
    it "Task had been delayed but it was done - has correct status and completion date" do
      done_date = date + 2
      subject = Task.new(title, date, 
        { status: DELAYED_DONE, done_date: done_date })
      
      subject.status.must_equal DELAYED_DONE
      subject.done_date.must_equal done_date
    end
  end

  describe "Delayed task" do
    it "Delayed task has correct stauts but no done date" do
      subject = Task.new(title, date, { status: DELAYED })

      subject.status.must_equal DELAYED
      subject.done_date.must_be_nil
    end
  end
end
