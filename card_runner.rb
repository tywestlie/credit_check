require './lib/credit_check'

def start
  puts "Enter a credit card number. Press Q to quit"
  num = gets.chomp
  abort if num == "q"
  card = CreditCheck.new(num)
  if card.valid == true
    puts "Card number is valid"
    abort
  else
    puts "Card number is invalid"
  end
  start
end

start
