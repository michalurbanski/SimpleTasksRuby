# Helper for checking if is null or empty, based on Rails implementation
# https://stackoverflow.com/questions/247948/is-there-a-better-way-of-checking-nil-or-length-0-of-a-string-in-ruby
module SimpleTasksRuby
  module Object
    # Module is included in libraries.rb file, based on:
    # Monkey-patching, based on https://www.justinweiss.com/articles/3-ways-to-monkey-patch-without-making-a-mess/
    def blank?
      respond_to?(:empty?) ? empty? : !self
    end
  end
end
