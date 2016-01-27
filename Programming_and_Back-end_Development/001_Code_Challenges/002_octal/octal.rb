class Octal
  attr_accessor :number
  
  def initialize(string)
    @number = string
    check_leading_zeros
    @number = '0' unless valid_number?
  end
  
  def to_decimal
    decimal = 0
    power_counter = 0
    @number.reverse.each_char do |char|
      decimal += char.to_i * (8**power_counter)
      power_counter += 1
    end
    decimal
  end
  
  private
  
  def valid_number?
    @number.to_i.to_s == @number &&
    !(('a'..'z').to_a + %w(8 9)).any? { |char| @number.include?(char) }
  end
  
  def check_leading_zeros
    while @number.start_with?('0')
      @number.slice!(0)
    end
  end
end