require 'spec_helper'

describe Task do
  subject { task }

  let(:date) { Date.new(2016, 1, 1) }
  let(:title) { "- this is task" }
  let(:task) { Task.new(title, date) } 

  describe "Base task" do
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
end
