# Question 1
puts "Question 1"
puts "-------------------------"
# What do you expect to happen when the greeting variable is referenced in the 
# last line of the code below?
if false
  greeting = “hello world”
end

puts greeting
# it will pop up and error because the greeting variable is not initialized because of the false condition in the
# if statement.
# Correct, the gretting variable will be nil, ruby initialize the variables inside an if block, Ruby initialize it to nil

# Question 2
puts "Question 2"
puts "-------------------------"
# What is the result of the last line in the code below?
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
# {a: 'hi there'}
# could have use:
# informal_greeting = greetings[:a].clone
# OR use string concatenation with '+' operator

# Question 3
puts "Question 3"
puts "-------------------------"
# n other exercises we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.
# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.
# What will be printed by each of these code groups?
# A) "one is: one" "two is: two" "three is: three"
#
# def mess_with_vars(one, two, three)
#   one = two
#   two = three
#   three = one
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# B) "one is: two" "two is: three" "three is: one"  WRONG, "=" creates an extra object, so does not mutates the caller.

# def mess_with_vars(one, two, three)
#   one = "two"
#   two = "three"
#   three = "one"
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# C) "one is: two" "two is: three" "three is: one"
# def mess_with_vars(one, two, three)
#   one.gsub!("one","two")
#   two.gsub!("two","three")
#   three.gsub!("three","one")
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# Question 4
puts "Question 4"
puts "-------------------------"
# A UUID is a type of identifier often used as a way to uniquely identify items...which 
# may not all be created by the same system. That is, without any form of synchronization, two 
# or more separate computer systems can create new items and label them with a UUID 
# with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.
# My way
def uuid()
  uuid_value = ''
  hex = %w(1 2 3 4 5 6 7 8 9 a b c d e f)
  8.times { uuid_value << hex.sample }
  uuid_value << "-"
  4.times { uuid_value << hex.sample }
  uuid_value << "-"
  4.times { uuid_value << hex.sample }
  uuid_value << "-"
  4.times { uuid_value << hex.sample }
  uuid_value << "-"
  12.times { uuid_value << hex.sample }
  uuid_value
end
puts uuid

# Pro way
def generate_UUID
  characters = [] 
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
puts generate_UUID

# Question 5
puts "Question 5"
puts "-------------------------"
# Ben was tasked to write a simple ruby method to determine if an input string is 
# an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar
# with regular expressions. Alyssa supplied Ben with a method called is_a_number?
# to determine if a string is a number and asked Ben to use it.
def is_a_number?(string)
  string.to_i.to_s == string
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.length != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    if is_a_number?(word)
      return false if word.to_i > 255
    else
      return false
    end
  end
  true
end
