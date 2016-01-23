# classes_and_objects_II_exercises.rb

class MyCar
  attr_accessor :color, :year, :model
  
  def self.gas_mileage(galons, miles)
    puts "#{miles / galons} miles per gallon of gas."
  end
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end
  
  def accelerate(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph"
  end
  
  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph"
  end
  
  def turn_car_off
    @current_speed = 0
    puts "Car is Off!"
  end
  
  def current_speed
    puts "You are now going #{@current_speed} mph."
  end
  
  def spray_paint(new_color)
    self.color = new_color
  end
  
  def to_s
    "This is a #{color} #{year} #{model} car."
  end
end

honda = MyCar.new(2005, "Blue", "Honda Civic")
puts honda

# 3. When running the following code...

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name
# We get the following error...
# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
#Answer: We get the error because we only declared the getter methods, not the setter.
# In order to make it work, we need to change the attr_reader to attr_accessor