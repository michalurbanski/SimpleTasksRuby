class StatusModel
  attr_reader :status
  attr_reader :date

  def initialize(status, date = nil)
    @status = status
    @date = date
  end
end
