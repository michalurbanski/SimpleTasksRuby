module SimpleTasksRuby
  class FileWriterService
    def initialize(foldername, filename)
      @foldername = foldername
      @filename = filename
      @path = File.join(@foldername, @filename)
    end

    def save(lines)
      return if lines.nil?

      create_directory_if_not_exists

      File.open(@path, 'w') do |f|
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
