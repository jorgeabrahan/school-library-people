require 'json'

class Storage
  def initialize(relative_path)
    @relative_path = relative_path
  end

  def preserve(data, file_name)
    File.write("./#{@relative_path}/#{file_name}", data.to_json)
  end
end