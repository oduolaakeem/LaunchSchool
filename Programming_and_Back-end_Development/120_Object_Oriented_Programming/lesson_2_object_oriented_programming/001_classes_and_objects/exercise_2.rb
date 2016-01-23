# exercise_2.rb

class Person
  attr_accessor :first_name, :last_name
  def initialize(name)
    self.first_name = name
    self.last_name = ""
  end
  
  def name
    first_name + " " + last_name
  end
end

# Modify the class definition from above to facilitate the following methods. 
# Note that there is no name= setter method now.

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'