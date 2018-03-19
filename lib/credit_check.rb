class CreditCheck
  attr_reader :creditnumber

  def initialize(num)
    @creditnumber = num
  end

  def correct_length
    return true if creditnumber.length == 16 || creditnumber.length == 15
    return false
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
    return false if sum_digits == 0
    return true if sum_digits % 10 == 0 && correct_length == true
  end
end
