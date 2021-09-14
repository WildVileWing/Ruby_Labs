def first_task
  students = File.open("students.txt")
  results = File.open("results.txt", "w")
  loop do
    puts "Введите возраст. Для выхода введите -1" 
    input_age = gets.to_i
    students.readlines.each do |line|
      if line.chomp.reverse[0,2].reverse == input_age.to_s
        results.puts  line
        puts "input_age"
      end
    end
    break if input_age == -1
  end
  results.close
  results = File.open("results.txt")
  results.readlines.each do |line|
    puts line
  end
  students.close
  results.close
end

def second_task
  if File.file?("balance.txt")
    balance = File.read("balance.txt").to_f
  else
    balance = File.write("balance.txt", 100.0, mode: "w").to_f
  end
   loop do
    puts "Введите одну из команд: \nD - Депозит \nW - Вывод \nB - Баланс \nQ - Выход"
    input_command = gets.chomp.to_s
    case input_command
    when "D", "d"
      puts "Введите сумму депозита:"
      deposit_number = gets.chomp.to_f
      if deposit_number > 0.0
        balance +=  deposit_number
        puts "Текущий баланс: #{balance}"
      else
        puts "Сумма введена некорректно."
      end
    when "W", "w"
      puts "Введите сумму вывода:"
      withdraw_number = gets.chomp.to_f
      if balance >= withdraw_number
        balance -=  withdraw_number
        puts "Текущий баланс: #{balance}"
      else
        puts "Сумма введена некорректно."
      end
    when "B", "b"
      puts balance
    when "Q", "q"
      break
    else
      puts "Комманды #{input_command} не существует, введу одну из представленнных."
    end
  end
end