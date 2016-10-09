require 'spec_helper'

# name of first element must be the same as class/module under test

# Integration tests
describe FileSystemDataReader do
  # before do
  # end

  describe "Read test data" do
    it "when invalid path then no data is read" do
      data_reader = FileSystemDataReader.new({
        :path => "test"
      })

      data_reader.read
      data_reader.lines.must_be_nil
    end

    it "when valid path is passed then data is read" do
      test_data = TestData.default_path
      data_reader = FileSystemDataReader.new({
        :path => test_data
      })

      data_reader.read
      data_reader.lines.wont_be_nil
    end
  end
end

# describe TestData do
#   describe "read test data" do
#     it "data read from test file is not null" do
#       test_data = act

#       test_data.lines.wont_be_nil
#     end

#     # We do not differentiate now between days
#     # but file can't have 7 days if it doesn't have at least 7 lines
#     it "data in test file must have at least 7 entries" do
#       test_data = act

#       test_data.lines.length.must_be :>=, 7
#     end
#   end

#   def act
#     test_data = TestData.new
#     test_data.read_data
#     test_data
#   end
# end

# describe FileSystemDataReader do
#   describe "test" do
#   it "intialize with empty data" do
#     lines = nil
#     lines.must_be_nil
#   end
# end
# end
