WRITERS_LIST_PATH = 'homework_lecture_4/tools_for_work_with_a_file/writers.txt'
BUFFER = 'buffer.txt'
def index
  File.foreach(WRITERS_LIST_PATH) {|writer| puts writer}
end

def find(id)
  file = File.open(WRITERS_LIST_PATH)
  puts file.readlines.map(&:chomp)[id-1]
  file.close
end

def where(pattern)
  file = File.open(BUFFER, 'w')
  list_of_indicies = []

  File.foreach(WRITERS_LIST_PATH).with_index do |writer, index|
    if writer.include?(pattern); list_of_indicies.push(index)
    end
  end

  file.close
  File.delete(BUFFER) if File.exist?(BUFFER)

  list_of_indicies
end

def update(id, text)
  file = File.open(BUFFER, 'w')
  File.foreach(WRITERS_LIST_PATH).with_index do |writer, index|
    file.puts(id == index ? text : writer)
  end

  file.close
  File.write(WRITERS_LIST_PATH, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, 'w')
  File.foreach(WRITERS_LIST_PATH).with_index do |writer, index|
    if id-1 != index; file.puts(writer)
    end
  end

  file.close
  File.write(WRITERS_LIST_PATH, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def create(name)
  File.write(WRITERS_LIST_PATH, "\n#{ name }", mode: "a")
end
