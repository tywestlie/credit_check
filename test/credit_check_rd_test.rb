require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check_rd.rb'
require 'pry'

class TestCreditCheck < Minitest::Test

  def test_exist
    card1 = CreditCheck.new

    assert_instance_of CreditCheck, card1
  end

  def test_digitize
    card1 = CreditCheck.new

    assert_equal card1.cardnumber.to_i.digits, card1.digitize
  end

  def test_multiply
    card1 = CreditCheck.new

    assert_equal [0, 8, 2, 10, 9, 14, 3, 4, 9, 16, 0, 16, 1, 8, 5, 10] , card1.multiply
  end

  def test_odd
    card1 = CreditCheck.new

    assert_equal 20 , card1.odd(10,3)
  end

  def test_simplify
    card1 = CreditCheck.new

    assert_equal [0, 8, 2, 1, 9, 5, 3, 4, 9, 7, 0, 7, 1, 8, 5, 1] , card1.simplify
  end

  def test_sum_it
    card1 = CreditCheck.new
    assert_equal 70,card1.sum_it
  end

  def test_for_valid
    card1 = CreditCheck.new(342804633855673)
    assert_equal "Number is valid!", card1.valid?
  end

  def test_for_not_valid
    card1 = CreditCheck.new(5541801923795240)
    assert_equal "Number is invalid!", card1.valid?
  end

end
