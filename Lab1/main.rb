require '../General_methods'
def greeting
  puts 'Введите свое Имя, Фамилию и возраст'
  first_name = gets.to_s
  second_name = gets.to_s
  age = gets.to_i
  if age < 18
    puts_return("Приветствую, #{first_name} #{second_name}. Тебе пора заняться программированием")
  else
    puts_return("Привет, #{first_name} #{second_name}. Самое время заняться программированием")
  end
end

def foobar
  puts 'Введите два числа'
  first_number = gets.to_i
  second_number = gets.to_i
  if first_number == 20 || second_number == 20
    puts_return('Было введено число 20')
  else
    puts_return("Сумма: #{first_number + second_number}")
  end
end

foobar
