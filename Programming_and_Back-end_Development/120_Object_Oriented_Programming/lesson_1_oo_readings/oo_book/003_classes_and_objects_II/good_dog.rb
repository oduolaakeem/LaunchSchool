# good_dog.rb

class GoodDog
  attr_accessor :name, :height, :weight
  # attr_reader :name # Only for getter methods
  # attr_writer :name # Only for setter methods
  
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says Arf!"
  end
  
  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
  
  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
  
  def self.what_am_i
    "I'm a GoodDog class!"
  end
end

sparky = GoodDog.new("sparky", '12 inches', '10 lbs')
puts sparky.info

sparky.change_info("Spartacus", "24 inches", "45 lbs")
puts sparky.info
puts sparky.name
puts GoodDog.what_am_i