# exercise_2.rb

class Person
  attr_accessor :first_name, :last_name
  def initialize(name)
    parse_full_name(name)
  end
  
  def name
    first_name + " " + last_name
  end
  
  def name=(n)
    parse_full_name(n)
  end
  
  def parse_full_name(full_name)
    self.first_name = full_name.split[0]
    !full_name.split[1] ? self.last_name = "" : self.last_name = full_name.split[1]
  end
end

# Now create a smart name= method that can take just a first name or a full
# name, and knows how to set the first_name and last_name appropriately.

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'
puts bob.name