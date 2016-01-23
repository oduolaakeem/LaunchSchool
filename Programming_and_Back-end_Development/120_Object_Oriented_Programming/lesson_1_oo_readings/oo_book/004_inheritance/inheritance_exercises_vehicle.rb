# inheritance_exercises.rb

module Hitchable
  def hitch
    "I hitched a trailer to my Vehicle."
  end
end

class Vehicle
  attr_accessor :year, :color, :model
  @@number_of_vehicles = 0
  
  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles."
  end
  
  def initialize(year, color, model)
    @@number_of_vehicles += 1
    @current_speed = 0
    self.year = year
    self.color = color
    self.model = model
  end
  
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
  def accelerate(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph"
  end
  
  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph"
  end
  
  def turn_vehicle_off
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
    "This is a #{color} #{year} #{model} vehicle."
  end
  
  def age
    "This #{self.model} is #{years_old} years old"
  end
  
  private
  
  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include Hitchable
end

honda = MyCar.new(2005, "Blue", "Honda Civic")
puts honda.current_speed
puts honda.color
toyota = MyTruck.new(215, "Red", "Toyota Lux")
puts Vehicle.number_of_vehicles
puts toyota.hitch
puts "---MyCar ancestors---"
puts MyCar.ancestors
puts "---MyTruck ancestors---"
puts MyTruck.ancestors
honda.accelerate(20)
honda.turn_vehicle_off
puts honda.age