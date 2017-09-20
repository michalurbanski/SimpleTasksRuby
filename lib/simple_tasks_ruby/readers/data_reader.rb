# Base class for all data readers
class DataReader
  attr_reader :lines

  def initialize(args={})
    @reader = args[:reader]

    post_initialize(args)
  end

  def read
    @reader.read
    @lines = @reader.lines
  end

  private
    def post_initialize args
      nil
    end
end
