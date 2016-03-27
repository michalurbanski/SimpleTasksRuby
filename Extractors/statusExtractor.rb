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

    return firstWord + ' ' + secondWord if firstWord.end_with? ","
    return firstWord
  end

  private
  def trim_start
    # sub! returns nil if no change was performed and result is unchanged
    @action.sub!(/^- /, '') # note that regular expression is without apostrophe
  end
end
