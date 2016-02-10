require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'calculator'

class CalculatorTest < Minitest::Test
  def setup
    @calculator = Calculator.new
  end
  
  def test_addition
    assert_equal(2, (@calculator.add(1, 1)))
  end
  
  def test_substraction
    assert_equal(0, (@calculator.substract(1, 1)))
  end
  
  def test_multiplication
    assert_equal(20, (@calculator.multiply(4, 5)))
  end
  
  def test_division
    assert_equal(5, (@calculator.divide(4, 20)))
  end
  
  def test_divide_by_zero
    assert_raises(ZeroDivisionError) { @calculator.divide(0, 20) }
  end
end