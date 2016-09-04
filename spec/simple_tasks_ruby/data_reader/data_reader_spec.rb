require 'minitest/autorun'
require 'spec_helper'

# name of first element must be the same as class/module under test
describe TestData do
  describe "read test data" do
    it "data read from test file is not null" do
      test_data = act

      test_data.lines.wont_be_nil
    end

    # We do not differentiate now between days
    # but file can't have 7 days if it doesn't have at least 7 lines
    it "data in test file must have at least 7 entries" do
      test_data = act

      test_data.lines.length.must_be :>=, 7
    end
  end

  def act
    test_data = TestData.new
    test_data.read_data
    test_data
  end
end
