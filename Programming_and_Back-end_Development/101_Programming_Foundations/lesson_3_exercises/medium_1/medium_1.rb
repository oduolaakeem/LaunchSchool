# Question 1
puts "Question 1"
puts "-------------------------"
# For this exercise, write a one-line program that creates the following output
# 10 times, with the subsequent line indented 1 space to the right
10.times { |value| puts((" " * value) + "The Flintstones Rock!")}

# Question 2
puts "Question 2"
puts "-------------------------"
statement = "The Flintstones Rock"
char_freq = {}
statement.each_char { |char| char_freq.key?(char) ? char_freq[char] += 1 : char_freq[char] = 1 }
char_freq.keep_if { |key, _| key != " "}
puts char_freq.to_s

# Question 3
puts "Question 3"
puts "-------------------------"
# The result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix it.
# It is an error because you are trying to sum apples with bananas (string with integers)
# First way
puts "the value of 40 + 2 is " + (40 + 2).to_s
# Second way
puts "the value of 40 + 2 is #{40 + 2}"

# Question 4
puts "Question 4"
puts "-------------------------"
# What hapens when we modify an array while we are iterating over it? What would be output by this code?
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
# it will ouput an 1 3 array, because in each iteration the first element is took out from the array then the next one is jumped.
# 
# What would be the ouptut by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# it will output number = [1, 2], because it is popping the elements out, so actually cant finish the each
# method as actually planned.

# Question 5
puts "Question 5"
puts "-------------------------"
# Alan wrote the following method, which was intended to show all the factors of the input number:
# def factors(number)
#   dividend = number
#   divisors = []
#   begin
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end until dividend == 0
#   divisors
# end
#
# Alyssa notices that this will fail if you call this with an input of 0 or negative number and asked 
# Alan to change the loop. How can you change the loop construct (instead fo using befin/end/until) to make this
# work? Note that we're not looking to find the factor for 0 or negative numbers, but we just want to handle it
# gracefully instead of raising an exception or going into an infinite loop.
#
# My way: use a while instead so from the start will prevent the number of being 0 or negative.
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end
puts factors(36)
# Bonus 1
# what is the purpose of the number % dividend == 0. Using the module (%) operator being equal to 0 will
# tell what numbers are divisors of the number.
# Bonus 2
# What is the purpose of the sencond-to-last line in the method (the divisors befor the method's end)?
# It serves the purpose to return the divisors array.

# Question 6
puts "Question 6"
puts "-------------------------"
# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling
# buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements
# in the buffer
# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". 
# Is there a difference between the two, other than what operator she chose to use to add an element to the
#buffer.
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
# In the first method, the caller is being mutated.
# In the second one, the caller is not mutated.

# Question 7
puts "Question 7"
puts "-------------------------"
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator, A user passes in two numbers,
# and the calculator will keep computing the sequence until some limit is reached.
# Ben coded up this iimplementation but complained that as soon as he ran it, he got an error. Something
# about the limit variable. What's wrong with the code?

LIMIT = 15 # wrong "limit = 15" in lowercase

def fib(first_num, second_num)
  while second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
# limit is declared outside the method without using CAPS, so the program actually does not see the variable. it should be declared
# as a constant.

# other way to do it is to add the limit variable as part of the method's arguments.
# result = fib(0, 1, 15)

# Question 8
puts "Question 8"
puts "-------------------------"
# In another example we used some built-in string methods to change the case of a string. A
# notably missing method is something provided in Rails, but not in Ruby itself... titleize ! This
# method in Ruby on Rails creates a string that has each word capitalized as it would be in title.
# Write your own version of the rails titleize implementation.

def titleize(string)
  string = string.split(" ").map! { |word| word.downcase.capitalize }.join(" ")  #my way
  #string = string.split.map { |word| word.downcase.capitalize }.join(" ") #pro way
end

string = "luCAS sos el mas"
puts titleize(string)
puts string

# Question 9
puts "Question 9"
puts "-------------------------"
# Given the munsters hash below
munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each member of the Munster family has an additional "age_group" key
# that has one of three values describing the age group the family member is in (kid, adult, senior).
# Your solution should produce the hash below.
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
puts munsters.to_s

