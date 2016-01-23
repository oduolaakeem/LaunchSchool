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
  
  def same_name_as?(other_person)
    self.first_name == other_person.first_name && self.last_name == other_person.last_name
  end
end

# Continuing with our Person class definition, what does the below print out?

bob = Person.new('Robert Smith')
puts "The person's name is: #{bob}"

# The person's name is: #<Person:0x00000002316580>