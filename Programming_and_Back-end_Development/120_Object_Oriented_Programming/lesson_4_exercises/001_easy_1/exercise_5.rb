# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

apple = Fruit.new("apple")
puts apple.instance_variables.to_s
primavera = Pizza.new("primavera")
puts primavera.instance_variables.to_s