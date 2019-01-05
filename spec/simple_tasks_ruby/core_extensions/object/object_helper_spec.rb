require 'spec_helper'

module SimpleTasksRuby
  class ObjectHelper
    describe "Blank?" do
      it "Null object is blank" do
        a = nil
        a.blank?.must_equal true
      end

      it "Empty string is blank" do
        a = ""
        a.blank?.must_equal true
      end

      it "Not empty string is not blank" do
        a = "not empty"
        a.blank?.must_equal false
      end
    end
  end
end
