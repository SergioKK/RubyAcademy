def greeting(arr)
  if arr.instance_of?(Array) and arr.count == 3

    name, surname, age = arr

    # В зависимости от возраста возвращаем разную информацию
    if age < 18
      return "Привет, #{name} #{surname}! Тебе меньше 18 лет, но начать учиться программировать
никогда не рано!"
    else
      return "Привет, #{name} #{surname}! Самое время заняться делом!"
    end
  end

  # Если введены неверные данные, то возвращаем понятную пользовтелю причину
  "Неправильный ввод. Напишите, пожалуйста, свое имя, фамилию и возраст."

end