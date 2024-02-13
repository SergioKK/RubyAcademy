require 'socket'
require 'rack'
require 'rack/utils'
require '/home/sergio/RubyAcademy/homework_lecture_4/ATM/atm.rb'

class App
  PATH = 'balance.txt'
  def call(env)
    req = Rack::Request.new(env)

    param = req.query_string.split('&').map { |param| param.split('=') }.to_h

    case req.path
    when '/deposit'
      cash_machine_controller('deposit', param)
      [200, {'Content-Type' => 'text/html'}, ["Successfully deposited!"]]
    when '/withdraw'
      cash_machine_controller('withdraw', param)
      [200, {'Content-Type' => 'text/html'}, ["Successfully withdraw!"]]
    when '/balance'
      [200, {'Content-Type' => 'text/html'}, ["Your balance is: #{ cash_machine_controller('balance', param) }"]]
    else
      [404, {'Content-Type' => 'text/html'}, ["Not found"]]
    end
  end

  def cash_machine_controller(action, param)
    #Read information from file or created new instance
    if File.exist?(PATH)
      user_balance = CashMachineMethods.new(File.read(PATH).to_i)
    else
      user_balance = CashMachineMethods.new
    end

    case action
    when 'deposit'
      user_balance.deposit(param['value'].to_i)
    when 'withdraw'
      user_balance.withdraw(param['value'].to_i)
    when 'balance'
      return user_balance.balance
    end

    File.write(PATH, user_balance.balance, mode: "w")

  end
end
