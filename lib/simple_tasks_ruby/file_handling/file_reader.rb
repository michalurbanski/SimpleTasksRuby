class FileReader
  include Logging

  attr_reader :lines
  attr_writer :filePath

  def initialize(filePath)
    @filePath = filePath
    logger.info "File path is #{filePath}"
  end

  def read
    logger.info "Reading file #{@filePath}"

    if check_if_file_exists
      @lines = read_lines
      logger.info "Reading file finished"
    else
      logger.info "Reading file failed"
    end
  end

  private
    def check_if_file_exists
      if File.exist?(@filePath) then
        if File.directory?(@filePath) then
          logger.info "File #{@filePath} is a directory, and not a file"
          return false
        else
          logger.info "Reading file..."
          return true
        end
      else
        logger.info "File #{@filePath} does not exist"
        return false
      end
    end

    def read_lines
      lines = IO.readlines(@filePath)

      # Creates hash where keys are line numbers, and values are lines
      # http://stackoverflow.com/questions/14528560/convert-an-array-to-hash-where-keys-are-the-indices
      # Lines numbers start from 1 
      lines_with_indices = ArrayModule.convert_to_hash_with_indices(lines)

      # But I want to have a model, instead of a hash, for better encapsulation

      results = Array.new

      lines_with_indices.each do |index, line|
        file_line = FileLine.new
        file_line.line_number = index
        file_line.line = line
        
        results.push(file_line)
      end

      results
    end
end
