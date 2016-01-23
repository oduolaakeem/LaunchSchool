# weighted_array.rb
require 'pry'

class WeightedArray
  attr_accessor :array, :weights, :ranges
  
  def initialize(array, weights_array = nil)
    self.array = array
    !weights_array ? set_weights : self.weights = weights_array
    set_ranges
  end
  
  def get_random_item
    random_value = Random.new.rand(self.ranges.last.last.to_f)
    random_selection = nil
    self.ranges.each_with_index do |range, index|
      if range[0] < random_value && random_value <= range[1]
        random_selection = self.array[index]
      end
    end
    random_selection
  end
  
  def increase_weight(index, units_increased)
    self.weights[index] += units_increased
    set_ranges
  end 
  
  def decrease_weight(index, units_decreased)
    self.weights[index] - units_decreased <= 0 ? self.weights[index] = 0 : self.weights[index] -= units_decreased
    set_ranges
  end
  
  def set_weights
    self.weights = []
    self.array.size.times {self.weights << 100}
  end
  
  def set_ranges
    self.ranges = []
    acum = 0
    self.weights.each do |weight|
      min = acum
      acum += weight
      max = acum
      self.ranges << [min, max]
    end
  end
  
  def to_s
    self.array.each_with_index do |value, index|
      puts "'#{value}' pick up chance #{(self.weights[index] / self.ranges.last.last.to_f * 100).round(2)}"
    end
  end
end

array = WeightedArray.new(['lucas', 'teo', 'kuatzel'], [10, 100, 100])
puts array

