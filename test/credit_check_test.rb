require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check.rb'
require 'pry'

class TestCreditCheck <Minitest::Test

  def test_does_exist
    card = CreditCheck.new("5541808923795240")

    assert_instance_of CreditCheck , card
  end

  def test_correct_length
    card = CreditCheck.new("5541808923795240")

    assert true , card.correct_length
  end

  def test_convert_to_integer
    card = CreditCheck.new("5541808923795240")

    assert_equal 5541808923795240, card.convert_to_integer
  end

  def test_convert_to_reverse_array
    card = CreditCheck.new("5541808923795240")

    assert_equal [0, 4, 2, 5, 9, 7, 3, 2, 9, 8, 0, 8, 1, 4, 5, 5], card.convert_to_reverse_array
  end

  def test_double_odd_index
    card = CreditCheck.new("5541808923795240")

    assert_equal [0, 8, 2, 10, 9, 14, 3, 4, 9, 16, 0, 16, 1, 8, 5, 10], card.double_odd_index
  end

  def test_odd_index
    card = CreditCheck.new("5541808923795240")

    assert_equal 20 , card.odd_index(10,1)
  end

  def test_simplify
    card = CreditCheck.new("5541808923795240")

    asset_equal = [0, 8, 2, 1, 9, 5, 3, 4, 9, 7, 0, 7, 1, 8, 5, 1], card.simplify
  end

  def test_sum_digits
    card = CreditCheck.new("5541808923795240")

    assert_equal 70, card.sum_digits
  end

  def test_valid
    card = CreditCheck.new("5541808923795240")

    assert_equal true, card.valid
  end

  def test_invalid
    card = CreditCheck.new("4024007106512380")

    assert_equal false, card.valid
  end

  def test_too_short
    card = CreditCheck.new("402400")

    assert_equal false, card.correct_length
  end

  def test_too_long
    card = CreditCheck.new("40240071065123800")

    assert_equal false, card.correct_length
  end

end
