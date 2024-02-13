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
