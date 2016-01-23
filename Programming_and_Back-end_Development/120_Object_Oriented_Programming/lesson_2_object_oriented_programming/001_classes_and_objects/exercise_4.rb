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

# Using the class definition from step #3, let's create a few more 
# people -- that is, Person objects.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
puts bob.same_name_as?(rob)

# If we're trying to determine whether the two objects contain the same
# name, how can we compare the two objects?