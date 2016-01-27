class Luhn
  attr_accessor :number, :digits, :checksum
  def initialize(num)
    @number = num
    addends
  end
  
  def addends
    @digits = @number.to_s.split("").reverse.map(&:to_i)
    @digits.map!.with_index { |digit, index| index.odd? ? digit * 2 : digit }
    @digits.map! { |digit| digit > 9 ? digit - 9 : digit }.reverse
  end
  
  def checksum
    @checksum = @digits.inject(:+)
  end
  
  def valid?
    checksum % 10 == 0
  end
  
  def self.create(num)
    test_digit = 0
    new_luhn = nil
    loop do
      new_luhn = Luhn.new((num.to_s + test_digit.to_s).to_i)
      break(new_luhn.number) if new_luhn.valid?
      test_digit += 1
    end
  end
end