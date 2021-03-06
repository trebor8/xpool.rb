require 'tempfile'
class IOWriter
  def initialize
    file = Tempfile.new '__xpool_test'
    @path = file.path
    file.close false
  end

  def call
    File.open @path, 'w' do |f|
      f.write 'true'
    end
  end

  def wrote_to_disk?
    if File.exist? @path
      val = File.read(@path)
      FileUtils.rm_rf @path
      val == 'true'
    end
  end
end
