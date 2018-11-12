# Concrete implementation of data reader for reading file system data
module SimpleTasksRuby
  class FileSystemDataReader
    include Logging # Includes module, so that calls do not have to be preceeded by Logging::

    attr_reader :lines

    def initialize(args)
      @file_path = args[:path]
    end

    def read
      raise ArgumentError, 'File is not provided' if @file_path.nil?

      if file_exists?
        @lines = read_lines
        logger.info("Reading file #{@file_path} finished")
      end
    end

    private
      def file_exists?
        return true if is_file?
        
        # If not a file, then it can be either directory or non-existing path
        add_message_if_directory
        return false
      end

      def is_file?
        if File.file?(@file_path)
          message = "Reading file #{@file_path}"
          is_file  = true
        else 
          message = "File #{@file_path} does not exist"
          is_file = false
        end

        # Interesting that in Ruby if does not create a new scope, so line below works
        logger.info(message)

        return is_file
      end

      def add_message_if_directory
        if File.directory?(@file_path)
          logger.info("Provided path: #{@file_path} is a directory")
        else
          logger.info("Provided path: #{@file_path} is not a directory")
        end
      end

      def read_lines
        lines = IO.readlines(@file_path)

        # Creates hash where keys are line numbers, and values are lines
        # http://stackoverflow.com/questions/14528560/convert-an-array-to-hash-where-keys-are-the-indices
        # Lines numbers start from 1 
        lines_with_indices = ArrayModule.convert_to_hash_with_indices(lines)

        # But I want to have a model, instead of a hash, for a better encapsulation.
        
        return construct_file_lines_objects(lines_with_indices)
      end

      def construct_file_lines_objects(lines_hash)
        results = Array.new

        lines_hash.each do |index, data|
          results.push(FileLine.new(index, data))
        end

        return results
      end
  end
end
