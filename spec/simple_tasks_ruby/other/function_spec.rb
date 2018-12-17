require 'spec_helper'

module SimpleTasksRuby
  describe "test function" do
    it "tests function" do
      # Correct, but commented out to avoid excessive output when running tests
      #printer = lambda{|x| puts(x)} # lambda, unlike Proc, checks number of arguments   
      #private_method(printer)

      skip "This is only example how lambda works like"
    end

    private
      def private_method(block)
        s = "this is test of private function"
        print "Printing class of block: "
        p(block.class)
    
        print "Printing block: "
        p(block)
    
        print "Calling block: "
        block.call(s)
      end
  end
end
