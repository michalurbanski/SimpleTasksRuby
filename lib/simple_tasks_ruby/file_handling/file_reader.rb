class FileReader
  include Logging # Includes module, so that calls do not have to be preceeded by Logging::

  attr_reader :lines

  def initialize(file_path)
    @file_path = file_path
    
    logger.info "File path is #{@file_path}"
  end

  def read
    logger.info "Reading file #{@file_path}"

    if file_exists?
      @lines = read_lines

      logger.info "Reading file finished"
    else
      logger.info "Reading file failed - file does not exist"
    end
  end

  private
    def file_exists?
      # TODO: rewrite, like in example about execution paths
      if File.exist?(@file_path) then
        if File.directory?(@file_path) then
          logger.info "File #{@file_path} is a directory, and not a file"
          
          return false
        else
          logger.info "Reading file..."
          
          return true
        end
      else
        logger.info "File #{@file_path} does not exist"
        
        return false
      end
    end

    def read_lines
      lines = IO.readlines(@file_path)

      # Creates hash where keys are line numbers, and values are lines
      # http://stackoverflow.com/questions/14528560/convert-an-array-to-hash-where-keys-are-the-indices
      # Lines numbers start from 1 
      lines_with_indices = ArrayModule.convert_to_hash_with_indices(lines)

      # But I want to have a model, instead of a hash, for better encapsulation

      results = Array.new

      lines_with_indices.each do |index, data|
        file_line = FileLine.new
        file_line.line_number = index
        file_line.data = data
        
        results.push(file_line)
      end

      results
    end
end
