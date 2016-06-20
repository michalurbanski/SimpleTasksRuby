require 'minitest/autorun'
require_relative '../../Modules/test_data_module'

# name of first element must be the same as class/module under test
describe TestDataModule do
  describe "read data" do
    it "data read from test file is not null" do
      data = TestDataModule.read_data
      data.wont_be_nil
    end
  end
end
