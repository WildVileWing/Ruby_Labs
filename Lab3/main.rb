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
    break if input_age == -1
    for student in students
      File.write("results.txt", student, mode: "a") if student.include?(input_age.to_s)
    end
  end
  students.close
  results.close
  File.foreach("results.txt"){|student| puts student}
end



def deposit
  puts "Введите сумму депозита:"
  deposit_number = gets.chomp.to_f
  if deposit_number > 0.0
    @balance +=  deposit_number
    puts_return("Текущий баланс: #{@balance}")
  else
    puts_return("Сумма введена некорректно.")
  end
end

def withdraw
  puts "Введите сумму вывода:"
  withdraw_number = gets.chomp.to_f
  if @balance >= withdraw_number
    balance -=  withdraw_number
    puts_return("Текущий баланс: #{b@alance}")
  else
    puts_return("Сумма введена некорректно.")
  end
end

def third_task
  if File.file?("balance.txt")
    @balance = File.read("balance.txt").to_f
  else
    @balance = File.write("balance.txt", 100.0, mode: "w").to_f
  end
  loop do
    puts "Введите одну из команд: \nD - Депозит \nW - Вывод \nB - Баланс \nQ - Выход"
    input_command = gets.chomp.to_s
    case input_command
    when "D", "d"
      deposit
    when "W", "w"
      withdraw
    when "B", "b"
      puts_return(@balance)
    when "Q", "q"
      break
    else
      puts_return("Комманды #{input_command} не существует, введу одну из представленнных.")
    end
  end
end
