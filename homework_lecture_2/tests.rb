require_relative "greetig"
require_relative "check_numbers"
require 'test/unit'

class StringExtensionTest < Test::Unit::TestCase
  def test_greeting
    old_man = "Steve", "Jobs", 42
    yong_man = "Bob", "Li", 15
    man_without_age = "John", "Doe"
    assert_equal(greeting(old_man), "Привет, Steve Jobs! Самое время заняться делом!")
    assert_equal(greeting(yong_man), "Привет, Bob Li! Тебе меньше 18 лет, но начать учиться программировать
никогда не рано!")
    assert_equal(greeting(1), "Неправильный ввод. Напишите, пожалуйста, свое имя, фамилию и возраст.")
    assert_equal(greeting(man_without_age), "Неправильный ввод. Напишите, пожалуйста, свое имя, фамилию и возраст.")
  end

  def test_assert_two_numbers
    assert_equal(check_numbers(1, 20), 1)
    assert_equal(check_numbers(20, 3), 3)
    assert_equal(check_numbers(1, 14), 15)
    assert_equal(check_numbers(20, 20), "Пасхалка")
    assert_equal(check_numbers("John", 20), "Неправильный ввод. Введите два числа.")
    assert_equal(check_numbers("John"), "Неправильный ввод. Введите два числа.")
  end
end

