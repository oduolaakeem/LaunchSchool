# PhoneNumber class

class PhoneNumber
  attr_reader :number

  def initialize(string)
    @number = string.scan(/\d/).join
    @number = '0' * 10 unless valid? && no_letters?(string)
    @number = @number[1..-1] if @number.size == 11
  end
  
  def area_code
    @number[0, 3]
  end
  
  def to_s
    @number = "(" + @number[0, 3] + ") " + @number[3, 3] + "-" + @number[6..-1]
  end

  private

  def valid?
    return false if @number.size < 10
    return false if @number.size == 11 && @number[0] != '1'
    return false if @number.size > 11
    true
  end
  
  def no_letters?(string)
    ('a'..'z').each { |char| return false if string.include?(char) }
    true
  end
end
