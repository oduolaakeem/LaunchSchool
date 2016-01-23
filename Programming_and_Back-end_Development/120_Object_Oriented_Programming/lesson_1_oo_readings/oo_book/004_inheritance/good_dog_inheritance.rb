# good_dog_inheritance.rb

class Animal
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
  
  def speak
    super + " from GoodDog class"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("brown")
puts sparky.speak
puts sparky.inspect