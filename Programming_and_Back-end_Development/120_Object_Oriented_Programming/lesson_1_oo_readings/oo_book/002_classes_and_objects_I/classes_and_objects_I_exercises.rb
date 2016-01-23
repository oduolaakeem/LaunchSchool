# classes_and_objects_I_exercises.rb

# 1. Create a class called MyCar. When you initialize a new instance or object
# of the class, allow the user to define some instance variables that tell us the
# year, color, and model of the car. Create an instance variable that is set to 0
# during instantiation of the object to track the current speed of the car as well.
# Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :color, :year, :model
  
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
end

honda = MyCar.new(1995, 'Blue', 'Honda Civic')
honda.accelerate(20)
honda.brake(10)
honda.current_speed
puts honda.year
puts honda.color
puts honda.model
honda.accelerate(40)
honda.spray_paint("Yellow")
puts honda.color

# 2. Add an accessor method to your MyCar class to change and view the color of
# your car. Then add an accessor method that allows you to view, but not modify,
# the year of your car.