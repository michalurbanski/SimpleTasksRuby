require 'spec_helper'

describe Logging do
  before do # before/after needed to maintain logging setting for tests execution
    @current_logging_value = Logging.is_logging_enabled
    Logging.is_logging_enabled = true
  end

  it 'logging by default is enabled' do
    Logging.is_logging_enabled.must_equal(true)
  end

  it 'logging can be disabled be setting is_logging_enabled to false' do
    Logging.is_logging_enabled = false
    result = Logging.is_logging_enabled
    
    result.must_equal(false)
  end

  after do
    Logging.is_logging_enabled = @current_logging_value
  end
end
