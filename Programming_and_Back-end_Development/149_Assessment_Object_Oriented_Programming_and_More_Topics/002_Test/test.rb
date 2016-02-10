class Calculator
  def initialize
    clear
  end
  
  def add(number2, number1 = @first_number)
    @result = number1 + number2
    @first_number = @result
  end
  
  def substract(number2, number1 = @first_number)
    @result = number1 - number2
    @first_number = @result
  end
  
  def multiply(number2, number1 = @first_number)
    @result = number1 * number2
    @first_number = @result
  end
  
  def divide(number2, number1 = @first_number)
    @result = number1 / number2
    @first_number = @result
  end
  
  def clear
    @first_number = 0
    @result = 0
  end
  
  def result
    @result
  end
end