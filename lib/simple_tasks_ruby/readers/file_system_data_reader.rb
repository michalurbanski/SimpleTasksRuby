# Concrete implementation of data reader for reading file system data
module SimpleTasksRuby
  class FileSystemDataReader
    include Logging # Includes module, so that calls do not have to be preceeded by Logging::

    attr_reader :lines

    def initialize(args)
      @file_path = args[:path]
    end

    def read
      if file_exists?
        @lines = read_lines

        message = "Reading #{@file_path} file finished"
      else
        message = "Reading file #{@file_path} failed - file does not exist"
      end

      logger.info(message)
    end

    private
      def file_exists?
        result = false

        if File.exist?(@file_path)
          if File.directory?(@file_path)
            message = "File #{@file_path} is a directory, and not a file"
          else
            result = true

            message = "Reading file #{@file_path} ..."          
          end
        else
          message = "File #{@file_path} does not exist"
        end

        logger.info(message)
        
        return result
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
