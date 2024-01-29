class CustomFile
  def initialize(path)
    @file = path
    @buffer = 'buffer.txt'
  end

  def index
    File.foreach(@file) {|writer| puts writer}
  end

  def find(id)
    file = File.open(@file)
    puts file.readlines.map(&:chomp)[id-1]
    file.close
  end

  def where(pattern)
    file = File.open(@buffer, 'w')
    list_of_indicies = []

    File.foreach(@file).with_index do |writer, index|
      if writer.include?(pattern); list_of_indicies.push(index)
      end
    end

    file.close
    File.delete(@buffer) if File.exist?(@buffer)

    list_of_indicies
  end

  def update(id, text)
    file = File.open(@buffer, 'w')
    File.foreach(@file).with_index do |writer, index|
      file.puts(id == index ? text : writer)
    end

    file.close
    File.write(@file, File.read(@buffer))

    File.delete(@buffer) if File.exist?(@buffer)
  end

  def delete(id)
    file = File.open(@buffer, 'w')
    File.foreach(@file).with_index do |writer, index|
      if id-1 != index; file.puts(writer)
      end
    end

    file.close
    File.write(@file, File.read(@buffer))

    File.delete(@buffer) if File.exist?(@buffer)
  end

  def create(name)
    File.write(@file, "\n#{ name }", mode: "a")
  end
end
