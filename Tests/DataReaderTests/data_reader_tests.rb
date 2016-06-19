require 'test/unit'
require_relative '../../Modules/test_data_module'

class DataReaderTests < Test::Unit::TestCase
  include TestDataModule

  def test_read_test_data
    data = TestDataModule.read_data
    assert_not_nil data
  end
end
