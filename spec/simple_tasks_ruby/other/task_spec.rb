require 'spec_helper'

describe Task do
  subject { task }

  let(:date) { Date.new(2016, 1, 1) }
  let(:title) { "- this is task" }
  let(:task) { Task.new(title, date) } 

  describe "Base task" do
    it "When base task is created it has date and title" do
      task.title.wont_be_nil
      task.title.must_equal title
      task.original_date.must_equal date
    end

    it "Base task has no additional properties" do 
      task.status.must_be_nil
      task.done_date.must_be_nil
    end
  end
end
