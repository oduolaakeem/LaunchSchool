# inheritance_exercises_student.rb

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(other_student)
    self.grade > other_student.grade
  end
  
  protected
  
  def grade
    @grade
  end
  
end

jon = Student.new("Jon", 98)
bob = Student.new("Bob", 65)
puts "Well done!" if jon.better_grade_than?(bob)

class Person
  def greet
    hi
  end
  private
  def hi
    puts "Hello Buddy!"
  end
end

# 8. Given the following code...
bob = Person.new
bob.greet
# and the corresponding error message...
# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# what is the problem and how would you go about fixing it?

# First option, make the method public. In the case it is not an option, just
# create a public method that will access the 'hi' method inside the class