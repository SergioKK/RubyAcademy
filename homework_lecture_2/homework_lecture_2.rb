# frozen_string_literal: true

def greeting(arr)
  if arr.instance_of?(Array) and arr.count == 3
    name, surname, age = arr
    if age < 18
      "Привет, #{name} #{surname}! Тебе меньше 18 лет, но начать учиться программировать
никогда не рано!"
    else
      "Привет, #{name} #{surname}! Самое время заняться делом!"
    end
  else
    "Неправильный ввод. Напишите, пожалуйста, свое имя, фамилию и возраст."
  end
end
