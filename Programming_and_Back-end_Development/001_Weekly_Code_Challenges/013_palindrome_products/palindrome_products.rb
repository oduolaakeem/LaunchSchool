require "pry"
class Palindromes
  
  def initialize(limits = {max_factor: 0, min_factor: 0})
    @max_factor = limits[:max_factor]
    limits[:min_factor] ? @min_factor = limits[:min_factor] : @min_factor = 0
    @factors = {}
  end
  
  def generate
    (@min_factor..@max_factor).each do |factor1|
      (factor1..@max_factor).each do |factor2|
        result = factor1 * factor2
        if result.to_s.reverse.to_i == result
          @factors[result] = [] unless @factors[result]
          @factors[result] << [factor1, factor2]
        end
      end
    end
  end
  
  def largest
    max_value = @factors.keys.max
    @filtered = @factors.select { |value, factor| value == max_value }
    self
  end
  
  def smallest
    min_value = @factors.keys.min
    @filtered = @factors.select { |value, factor| value == min_value }
    self
  end
  
  def value
    @filtered.keys.first
  end
  
  def factors
    @filtered.values.first
  end
end
