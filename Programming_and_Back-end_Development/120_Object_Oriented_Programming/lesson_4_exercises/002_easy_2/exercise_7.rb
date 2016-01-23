# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would
# you need to write to test your theory?

# @@cats_count keep the count of the number of object instanciated in the 
# program with the class Cat

kitty = Cat.new('pur')
puts "Number of Cat objects created: #{Cat.cats_count}"
garfield = Cat.new('fatty')
puts "Number of Cat objects created: #{Cat.cats_count}"