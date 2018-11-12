require 'spec_helper'

# name of first element must be the same as class/module under test
module SimpleTasksRuby
  describe FileSystemDataReader do
    # before do
    # end

    describe "Read test data (unit tests)" do
      it "When no path is provided then exception is thrown" do
        data_reader = FileSystemDataReader.new({})
        lambda { data_reader.read }.must_raise ArgumentError
      end
    end

    describe "Read test data (integration tests)" do
      it "When file path is invalid then no data is read" do
        data_reader = FileSystemDataReader.new({
          :path => "some_not_existing_file_path"
        })

        data_reader.read
        data_reader.lines.must_be_nil
      end

      it "When valid path is passed then data is read" do
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
        return [TestData.multiple_weeks_path, ProductionData.get_path]
      end
  end
end
