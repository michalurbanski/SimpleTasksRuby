require 'test/unit'

class FunctionTest < Test::Unit::TestCase
  def test_function
    printer = lambda{|x| puts(x)}
    private_method(printer)

    omit('temporarily omitted')
  end

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
