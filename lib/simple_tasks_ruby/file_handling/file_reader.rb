class FileReader
  include Logging

  attr_reader :lines

  def initialize(filePath)
    @filePath = filePath
  end

  def read_file
    logger.info "Reading file #{@filePath}"

    check_if_file_exists
    @lines = read_lines

    logger.info "Reading file finished"
  end

  private
  def check_if_file_exists
    if File.exists?(@filePath) then
      if File.directory?(@filePath) then
        logger.info "File #{@filePath} is a directory"
        exit
      else
        logger.info "Reading file..."
      end
    else
      logger.info "File #{@filePath} does not exist"
      exit
    end
  end

  def read_lines
    IO.readlines(@filePath)
  end
end
