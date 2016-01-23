# good_dog_super.rb

class Animal
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

puts BadDog.new(2, "bear").inspect