require 'spec_helper' 

describe FileReader do 
  it 'Reader when created has no lines' do 
    reader = FileReader.new('')

    reader.lines.must_be_nil
  end
end
