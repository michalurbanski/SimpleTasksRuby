# Extracts status from single action
class StatusExtractor
  def initialize(action)
    @action = action # single line in day in input file
  end

  def extractStatus
    trim_start

    words = @action.split(' ')

    firstWord = words.first
    secondWord = words[1]

    if firstWord == "DONE" or firstWord == "ABORTED"
      return firstWord
    else
      return firstWord + ' ' + secondWord
    end

  end

  private
  def trim_start
    # sub! returns nil if no change was performed and result is unchanged
    @action.sub!(/^- /, '') # note that regular expression is without apostrophe
  end
end
