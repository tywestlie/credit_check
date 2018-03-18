require './lib/credit_check_rd'

puts "Enter a credit card number"
num = gets.chomp
card = CreditCheck.new(num)
puts card.valid? 
