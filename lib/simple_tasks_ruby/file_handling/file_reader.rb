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
    if File.exists?(@filePath) then
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
    IO.readlines(@filePath)
  end
end
