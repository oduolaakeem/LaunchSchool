# the_object_model_exercises.rb

# 1. How do we create an object in Ruby? Give an example of the creation of an object.
class MyObject
  include MyModule
end

my_object_instance = MyObject.new

# 2. What is a module? What is its purpose? How do we use them with our classes? 
# Create a module for the class you created in exercise 1 and include it properly.
# A module is a collection of behaviors. The purpose is to share those behaviors
# with multiple objects/classes. We use them in our classes using mixins, declaring
# the module in the class using the keyword include.
module MyModule
end