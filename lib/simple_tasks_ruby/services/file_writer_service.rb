module SimpleTasksRuby
  class FileWriterService
    def initialize(foldername)
      @foldername = foldername
    end

    # filename is input to this method, 
    # becuase we might want to write different results to different files
    def save(filename, lines)
      # TODO: implement checking if null or empty using this method from Rails 
      # Write tests for this new method
      # https://stackoverflow.com/questions/247948/is-there-a-better-way-of-checking-nil-or-length-0-of-a-string-in-ruby
      return if filename.nil? || filename.empty? || lines.nil? # TODO: write test for this

      path = File.join(@foldername, filename)

      create_directory_if_not_exists

      File.open(path, 'w') do |f|
        lines.each do |line|
          f << "#{line}"
        end
      end
    end

    private
      def create_directory_if_not_exists()
        Dir.mkdir @foldername unless File.exist? @foldername
      end
  end
end
