def check_numbers(first_number='a', second_number='b')

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
