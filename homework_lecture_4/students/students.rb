STUDENTS_LIST_PATH = 'homework_lecture_4/students/students.txt'
RESULT = 'homework_lecture_4/students/result.txt'

file = File.open(RESULT, 'w')

while STUDENTS_LIST_PATH

  age = gets.chomp

  if age.to_i == -1 or File.new(STUDENTS_LIST_PATH).size == file.size
    break
  end

  File.foreach(STUDENTS_LIST_PATH) do |student|
    if student.include?(age); file.puts(student)
    end
  end
end

file.close

puts File.read(RESULT)
