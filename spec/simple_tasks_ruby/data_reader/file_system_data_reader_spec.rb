require 'spec_helper'

# name of first element must be the same as class/module under test

# Integration tests
describe FileSystemDataReader do
  # before do
  # end

  describe "Read test data (integration tests)" do
    it "when invalid path then no data is read" do
      data_reader = FileSystemDataReader.new({
        :path => "test" # not existing file path
      })

      data_reader.read
      data_reader.lines.must_be_nil
    end

    it "when valid path is passed then data is read" do
      valid_test_paths.each do |path|
        data_reader = FileSystemDataReader.new({
          :path => path
        })

        data_reader.read
        data_reader.lines.wont_be_nil
      end
    end
  end

  private
  def valid_test_paths
    array = Array.new
    array.push(TestData.multiple_weeks_path)
    array.push(ProductionData.default_path)
    array
  end
end
