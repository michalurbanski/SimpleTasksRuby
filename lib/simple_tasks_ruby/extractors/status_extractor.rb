# Extracts status from single action
module SimpleTasksRuby
  module StatusExtractor
    extend self

    COMMA = ","

    def extract_status(text)
      trimmed = trim_start(text)

      # If "- " is not at the beginning then something is wrong with this line and we don't want to parse it
      return StatusModel.new(text) if trimmed == text

      words = trimmed.split(' ')

      firstWord = words.first
      secondWord = words[1]
      thirdWord = words[2] # Note: in Ruby it does not cause out of bounds exception; returns nil if does not exist

      # Have to be in a correct order
      return StatusModel.new(firstWord + ' ' + secondWord) if is_delayed_task(firstWord, secondWord) 
      return StatusModel.new(firstWord + ' ' + secondWord, thirdWord) if is_delayed_and_done_task(firstWord)
      return StatusModel.new(firstWord)
    end

    private
      def trim_start(text)
        text.sub(/^- /, '') # Note that regular expression is without apostrophe
      end

      def is_delayed_task(firstWord, secondWord)
        firstWord.end_with?(COMMA) and secondWord == "-"
      end

      def is_delayed_and_done_task(firstWord)
        firstWord.end_with?(COMMA)
      end
  end
end
