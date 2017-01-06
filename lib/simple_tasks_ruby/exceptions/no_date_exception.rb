class NoDateException < Exception
  def to_s
    puts "Day must have date provided"
  end
end
