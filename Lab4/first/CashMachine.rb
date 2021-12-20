class CashMachine
  def initialize
    if File.file?("balance.txt")
      @balance = File.read("balance.txt").to_f
    else
      @balance = File.write("balance.txt", 100.0, mode: "w").to_f
    end
  end


  def check_balance(balance_file_path)
    if File.file?(balance_file_path)
      @balance = File.read(balance_file_path).to_f
    else
      @balance = File.write(balance_file_path, 100.0, mode: "w").to_f
    end
  end

  def deposit
    puts "Введите сумму депозита:"
    amount = gets.to_f
    if amount > 0.0
      @balance +=  amount
      puts "Текущий баланс = #{@balance}"
    else
      puts "Сумма введена некорректно."
    end
    File.write("balance.txt", @balance)
  end

  def withdraw
    puts "Введите сумму вывода:"
    amount = gets.to_f
    if @balance >= amount
      @balance -=  amount
      puts "Текущий баланс = #{@balance}"
    else
      puts "Сумма введена некорректно."
    end
    File.write("balance.txt", @balance)
  end

  def balance
    puts "Текущий баланс = #{@balance}"
  end

  def init
    puts "Введите одну из команд: \nD - Депозит \nW - Вывод \nB - Баланс \nQ - Выход"
    loop do

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
        puts "Комманды #{input_command} не существует, введу одну из представленнных."
      end
      puts "D - Депозит \nW - Вывод \nB - Баланс \nQ - Выход"
    end

  end
end

