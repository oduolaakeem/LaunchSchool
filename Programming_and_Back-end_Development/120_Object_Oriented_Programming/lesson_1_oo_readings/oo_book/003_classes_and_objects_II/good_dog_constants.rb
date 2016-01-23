# good_dog_constants.rb

class GoodDog
  DOG_YEARS = 7
  
  attr_accessor :name, :age
  
  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end
  
  def to_s
    "This dog's name is #{self.name} and it is #{self.age} in dog years."
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age
puts sparky