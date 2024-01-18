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

def foobar(first_number='a', second_number='b')

  # Проверяем данные на вход
  if !first_number.instance_of?(Integer) or !second_number.instance_of?(Integer)
    return "Неправильный ввод. Введите два числа."
  end

  # Основная логика
  return first_number + second_number if first_number != 20 and second_number != 20

  # Уникальынй случай
  return "Пасхалка" if first_number == 20 and second_number == 20

  # Если одно из чисел равно 20, то возвращаем второе
  first_number == 20? second_number : first_number

end
