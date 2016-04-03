require_relative "../Models/status_model"

# Extracts status from single action
class StatusExtractor
  def initialize(action)
    @action = action # single line in day in input file
  end

  def extract_status
    trim_start
    words = @action.split(' ')

    firstWord = words.first
    secondWord = words[1]
    thirdWord = words[2]

    return StatusModel.new(firstWord + ' ' + secondWord) if (firstWord.end_with? "," and secondWord == "-")
    return StatusModel.new(firstWord + ' ' + secondWord, thirdWord) if firstWord.end_with? ","
    return StatusModel.new(firstWord)
  end

  private
  def trim_start
    # sub! returns nil if no change was performed and result is unchanged
    @action.sub!(/^- /, '') # note that regular expression is without apostrophe
  end
end
