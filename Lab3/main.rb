require '../General_methods'
#first task
def index(file_path)
  file_line = File.open(file_path)
  file_line.readlines.each do |line|
    puts_return(line.chomp)
  end
  file_line.close
end

def find(file_path, id)
  file_line = File.open(file_path)
  file_line.each_with_index do |line, index|
    puts_return(line)if id == index+1
  end
  file_line.close
end

def where(file_path, pattern)
  file_line = File.open(file_path)
  file_line.readlines.each do |line|
    if (line.chomp[0, pattern.length] == pattern.to_s) ||
      (line.chomp.reverse[0, pattern.length].reverse == pattern.to_s)
      puts_return(line)
    end
  end
  file_line.close
end

def update(file_path, id, text)
  temp = File.open("temp.txt", 'w')
  file_line = File.open(file_path)
  file_line.each_with_index do |line, index|
    temp.puts(id == index+1 ? text : line)
  end
  temp.close
  File.write("line.txt", File.read("temp.txt"))
  file_line.close
  File.delete("temp.txt")
end

def delete(file_path, id)
  temp = File.open("temp.txt", 'w')
  file_line = File.open(file_path)
  file_line.each_with_index do |line, index|
    temp.puts line if id != index+1
  end
  temp.close
  file_line.close
  File.write("line.txt", File.read("temp.txt"))
  File.delete("temp.txt")
end


def second_task
  students = File.open("students.txt")
  results = File.open("results.txt", "w")
  loop do
    puts "Введите возраст. Для выхода введите -1"
    input_age = gets.to_i
    students.readlines.each do |line|
      if line.chomp.reverse[0, 2].reverse == input_age.to_s
        results.puts  line
      end
    end
    break if input_age == -1
  end
  results.close
  results = File.open("results.txt")
  results.readlines.each do |line|
    puts_return(line)
  end
  students.close
  results.close
end

def third_task
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
        puts_return("Текущий баланс: #{balance}")
      else
        puts_return("Сумма введена некорректно.")
      end
    when "W", "w"
      puts "Введите сумму вывода:"
      withdraw_number = gets.chomp.to_f
      if balance >= withdraw_number
        balance -=  withdraw_number
        puts_return("Текущий баланс: #{balance}")
      else
        puts_return("Сумма введена некорректно.")
      end
    when "B", "b"
      puts_return(balance)
    when "Q", "q"
      break
    else
      puts_return("Комманды #{input_command} не существует, введу одну из представленнных.")
    end
  end
end


second_task