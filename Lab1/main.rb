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

def foobar(first_number, second_number)
  puts 'Введите два числа'
  if first_number == 20 || second_number == 20
    puts_return(20)
  else
    puts_return("Сумма: #{first_number + second_number}")
  end
end

greeting
foobar(1, 20)
