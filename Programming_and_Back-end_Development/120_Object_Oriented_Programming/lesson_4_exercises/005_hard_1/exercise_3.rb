# Building on the prior vehicles question, we now must also track a basic
# motorboat. A motorboat has a single propeller and hull, but otherwise
# behaves similar to a catamaran. Therefore, creators of Motorboat
# instances don't need to specify number of hulls or propellers.
# How would you modify the vehicles code to incorporate a new Motorboat class?

module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency
  
  def range
    self.fuel_capacity * self.fuel_efficiency
  end
end

class WheeledVehicle
  include MoveableGround

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with
    super([20,20], 80, 8.0)
  end
end

# Now Alan has asked them to incorporate a new type of vehicle into their
# system - a Catamaran defined as follows:

class Seacraft
  include Moveable
  
  attr_accessor :propeller_count, :hull_count
  def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    @fuel_efficiency = fuel_efficiency
    @fuel_capacity = fuel_capacity
  end
  
  def range
    range_by_using_fuel = super
    return range_by_using_fuel + 10
  end
end

class Catamaran < Seacraft

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super
  end
end

class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# This new class does not fit well with the object hierarchy defined so far.
# Catamarans don't have tires. But we still want common code to track fuel
# efficiency and range. Modify the class definitions and move code into a
# Module, as necessary, to share code among the Catamaran and the wheeled vehicles.