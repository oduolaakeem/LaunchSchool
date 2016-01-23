
# Let's create a few more methods for our Dog class.

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end
  
  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

puts pete.run                # => "running!"
puts pete.speak rescue              # => NoMethodError

puts kitty.run               # => "running!"
puts kitty.speak             # => "meow!"
puts kitty.fetch rescue             # => NoMethodError

puts dave.speak              # => "bark!"

puts bud.run                 # => "running!"
puts bud.swim                # => "can't swim!"

# Create a new class called Cat, which can do everything a dog can, except 
# swim or fetch. Assume the methods do the exact same thing. Hint: don't 
# just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

# Hierarchy diagram:
#        Pet
#         |
#     -----------
#     |         |
#    Dog       Cat
#     |
#  Bulldog

# The method lookup path is the order in whic ruby will look for a method when is
# called from an instance