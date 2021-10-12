class CashMachine
  def initialize(balance_file_path)
    check_balance(balance_file_path)
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
    amount = gets.chomp.to_f
    if amount > 0.0
      @balance +=  amount
      puts "Текущий баланс: #{@balance}"
    else
      puts "Сумма введена некорректно."
    end
  end

  def withdraw
    puts "Введите сумму вывода:"
    amount = gets.chomp.to_f
    if @balance >= amount
      @balance -=  amount
      puts "Текущий баланс: #{@balance}"
    else
      puts "Сумма введена некорректно."
    end
  end

  def show_balance
    puts @balance
  end

end

class First_task
  def self.init
    balance_path = "balance.txt"
    atm = CashMachine.new(balance_path)

    loop do
      puts "Введите одну из команд: \nD - Депозит \nW - Вывод \nB - Баланс \nQ - Выход"
      input_command = gets.chomp.to_s
      case input_command
      when "D", "d"
        atm.deposit
      when "W", "w"
        atm.withdraw
      when "B", "b"
        atm.show_balance
      when "Q", "q"
        break
      else
        puts "Комманды #{input_command} не существует, введу одну из представленнных."
      end
    end

  end

end
