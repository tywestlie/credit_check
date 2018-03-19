require './lib/credit_check'

puts "Enter a credit card number"
num = gets.chomp
card = CreditCheck.new(num)

if card.valid == true
  puts "Card number is valid"
else
  puts "Card number is invalid"
end
