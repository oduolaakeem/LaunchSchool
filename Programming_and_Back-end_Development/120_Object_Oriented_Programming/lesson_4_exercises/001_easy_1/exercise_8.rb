# If we have a class such as the one below:

# You can see in the make_one_year_older method we have used self.
# What does self refer to here?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# it refers to the object (instance) of the class Cat. As follows:

kitty = Cat.new('cute')
kitty.make_one_year_older
puts kitty.age

# the self in the make_one_year_older method is the same as calling kitty.age.