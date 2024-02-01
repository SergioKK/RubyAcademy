class CashMachineMethods
  attr_accessor :balance
  def initialize(balance=100)
    @balance = balance
  end

  def deposit(number)
    if number > 0
      @balance += number
    else
      raise "Please enter number above 0"
    end
  end

  def withdraw(number)
    if (@balance - number) > 0 and number > 0
      @balance -= number
    else
      raise "Please enter sum bigger than your deposit"
    end
  end
end

class CashMachine
  PATH = 'balance.txt'
  def self.init
    command = 0

    if File.exist?(PATH)
      user_balance = CashMachineMethods.new(File.read(PATH).to_i)
    else
      user_balance = CashMachineMethods.new
    end

    loop do
      puts "Please enter command you want to do with your deposit: 'D' to deposit, " \
      "'W' to withdraw, 'B' to see balance, 'Q' to quit"
      command = gets.chomp.downcase
      break if command == 'q'

      begin
        if command == "d"
          puts "Please enter sum you want to deposit: "
          number = gets.chomp.to_i
          user_balance.deposit(number)
          puts "Your balance is: #{user_balance.balance}"
        elsif command == "w"
          puts "Please enter sum you want to withdraw: "
          number = gets.chomp.to_i
          user_balance.withdraw(number)
          puts "Your balance is: #{user_balance.balance}"
        elsif command == "b"
          puts "Your balance is: #{user_balance.balance}"
        end
      rescue => name
        puts name
      end
    end

    File.write(PATH, user_balance.balance, mode: "w")

  end
end

CashMachine.init
