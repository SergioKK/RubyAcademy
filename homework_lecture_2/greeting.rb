def greeting
  puts "Пожалуйста, введите ваше имя:"
  name = gets.chomp
  puts "Пожалуйста, введите вашу фамилию:"
  surname = gets.chomp
  puts "Пожалуйста, введите ваш возраст:"
  age = gets.chomp.to_i

  # В зависимости от возраста возвращаем разную информацию
  if age < 18
    puts "Привет, #{name} #{surname}! Тебе меньше 18 лет, но начать учиться программировать никогда не рано!"
  else
    puts "Привет, #{name} #{surname}! Самое время заняться делом!"
  end
end