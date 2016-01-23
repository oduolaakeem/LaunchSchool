# good_dog.rb

class GoodDog
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
  
  def name=(n)
    @name = n
  end
  
  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("sparky")
puts sparky.speak
puts sparky.name
sparky.name=("Spartacus")
puts sparky.name
