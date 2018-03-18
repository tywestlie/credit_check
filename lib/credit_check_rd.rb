class CreditCheck
 attr_reader :cardnumber

  def initialize(cardnumber = "5541808923795240")
    @cardnumber = cardnumber
  end

  def digitize
    @cardnumber.to_i.digits
  end

  def multiply
    digitize.map.with_index do |num, index|
      odd(num, index)
    end
  end

  def odd(num, index)
    return num * 2 if index.odd?
    return num
  end

  def simplify
    multiply.map do|num|
      num.digits.sum
    end
  end

  def sum_it
    simplify.sum
  end

  def valid?
    return "Number is valid!"  if sum_it % 10 == 0
    return "Number is invalid!"
  end

end
