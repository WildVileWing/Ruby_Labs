require '../General_methods'
#first task
def index(file_path)
  file_line = File.open(file_path)
  file_lines = file_line.readlines.map(&:chomp)
  file_line.close
  file_lines
end

def find(file_path, id)
  student = student
  file_line = File.open(file_path)
  file_line.each_with_index do |line, index|
    student = line if id == index+1
  end
  file_line.close
  student.chomp.chomp
end

def where(file_path, pattern)
  pattern_lines = []
  file_line = File.open(file_path)
  file_line.readlines.each do |line|
    if line.include? pattern
      pattern_lines.push line
    end
  end
  file_line.close
  pattern_lines
end

def update(file_path, id, text)
  temp = File.open("temp.txt", 'w')
  file_line = File.open(file_path)
  file_line.each_with_index do |line, index|
    temp.puts(id == index+1 ? text : line)
  end
  temp.close
  File.write("line.txt", File.read("temp.txt"))
  File.delete("temp.txt")
  file_line.close
end

def delete(file_path, id)
  temp = File.open("temp.txt", 'w')
  file_line = File.open(file_path)
  file_line.each_with_index do |line, index|
    temp.puts line if id != index+1
  end
  File.write("line.txt", File.read("temp.txt"))
  File.delete("temp.txt")
  temp.close
  file_line.close
end


def second_task
  input = File.open("students.txt")
  students = input.readlines.map(&:chomp)
  results = File.open("results.txt", "a")
  loop do
    puts "Введите возраст. Для выхода введите -1"
    input_age = gets.to_i
    break if input_age == -1
    for student in students
      File.write(results, "#{student}\n", mode: "a") if student.include?(input_age.to_s)
    end
  end
  File.foreach(results){|line| line}
  results.close



end

def deposit
  puts "Введите сумму депозита:"
  deposit_number = gets.to_f
  if deposit_number > 0
    @balance = @balance.to_f + deposit_number
  else
    puts_return("Сумма введена некорректно.")
  end
end

def withdraw
  puts "Введите сумму вывода:"
  @balance = 100.0
  withdraw_number = gets.to_f
  if @balance.to_f > withdraw_number
    @balance = @balance - withdraw_number
  else
    puts_return("Сумма введена некорректно.")
  end
end

def balance
  puts "Текущий баланс #{@balance}"
end

def third_task
  if File.file?("balance.txt") & File.read("balance.txt") != nil
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
      balance
    when "Q", "q"
      break
    else
      puts_return("Комманды #{input_command} не существует, введу одну из представленнных.")
    end
  end
end
