module SimpleTasksRuby
  class FileWriterService
    def initialize(foldername)
      @foldername = foldername
    end

    # Filename is an input argument to this method,
    # becuase we might want to write different results to different files
    def save(filename, lines)
      return if filename.blank? || lines.blank?

      create_directory_if_not_exists

      path_to_file = File.join(@foldername, filename)
      save_to_file(path_to_file, lines)
    end

    private
      def create_directory_if_not_exists
        Dir.mkdir @foldername unless File.exist? @foldername
      end

      def save_to_file(path_to_file, lines)
        File.open(path_to_file, 'w') do |f|
          lines.each do |line|
            f << "#{line}"
          end
        end
      end
  end
end
