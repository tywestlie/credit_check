class CreditCheck
  attr_reader :creditnumber

  def initialize(num)
    @creditnumber = num
  end

  def correct_length(creditnumber)
    return false if creditnumber.length ==! 15 && creditnumber.length ==! 16
    return true
  end

  def convert_to_integer
    @creditnumber.to_i
  end

  def convert_to_reverse_array
    convert_to_integer.digits
  end

  def double_odd_index
    convert_to_reverse_array.map.with_index do |num, index|
       odd_index(num, index)
     end
  end

  def odd_index(num,index)
    return num * 2 if index.odd?
    return num
  end

  def simplify
    double_odd_index.map do |num|
      num.digits.sum
    end
  end

  def sum_digits
    simplify.sum
  end

  def valid
    return "Your card is valid." if sum_digits % 10 == 0 && correct_length(creditnumber) == true
    return "Your card is invalid."
  end

end
