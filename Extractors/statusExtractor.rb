# Extracts status from single action
class StatusExtractor
  def initialize(action)
    @action = action # single line in day in input file
  end

  def extractStatus
    trim_start
    status = @action.split.first
  end

  private
  def trim_start
    # sub! returns nil if no change was performed and result is unchanged
    @action.sub!(/^- /, '') # note that regular expression is without apostrophe
  end
end
