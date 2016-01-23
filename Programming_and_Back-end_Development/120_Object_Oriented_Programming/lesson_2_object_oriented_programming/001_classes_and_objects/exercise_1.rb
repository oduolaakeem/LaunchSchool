# exercise_1.rb

class Person
  attr_accessor :name
  def initialize(name)
    self.name = name
  end
end

# Given the below usage of the Person class, code the class definition.

bob = Person.new('bob')
puts bob.name
bob.name = 'Robert'
puts bob.name