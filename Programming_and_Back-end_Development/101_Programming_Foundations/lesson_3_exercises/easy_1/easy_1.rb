# exercises: easy_1

# Question 1
# What would you expect the code below to print out?
puts "Question 1"
puts "-------------------------"
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers  #correct => 1 2 2 3   incorrect => [1, 2, 3]

# Question 2
# Describe the difference between ! and ? in Ruby
#   ! at the end of a method, normally means that is a destructive method, or mutates the caller.
#   ? at the end of a method, normally means that the method will return a boolean value.
# Explain what would happen in the following scenarios:
#   scenario 1: what is != and where should you use it
#     != is a boolean operator to indicate different (like 1 != 2 will be true). it could be
#     usedin any conditional statement, like an if statement.
#   scenario 2: put ! before something, like !user_name.
#     the boolean value of the variable user_name will be negated, like NOT(user_name)
#   scenario 3: put ! after something, like words.uniq!
#     will mutate the variable words after executing the uniq method
#   scenario 4: put ? before something
#     error???
#   scenario 5: put ? after something.
#     case 1, ternary operator to check a condition.
#     case 2, after a method normally means that the method will return a boolean value.
#   scenario 6: put !! before something, like !!user_name
#     double negation, will be the same as putting just user_name

# Question 3
# Replace the word "important" with "urgent" in this string:
#  My long and bad way to do it
puts "Question 3"
puts "-------------------------"
advice = "Few things in life are as important as house training your pet dinosaur."
advice = advice.split(" ")
word_index = 0
advice.each_with_index do |value, index|
  value == "important" ? word_index = index : next
end
advice[word_index] = "urgent"
advice = advice.join(" ")
puts advice

# The way to do it
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")
puts advice

# Question 4
# Delete methods
puts "Question 4"
puts "-------------------------"
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)  #[1, 3, 4, 5]
puts numbers.to_s

numbers = [1, 2, 3, 4, 5]
numbers.delete(1) #[2, 3, 4, 5]
puts numbers.to_s

# Question 5
# Programmatically determine if 42 lies between 10 and 100.
puts "Question 5"
puts "-------------------------"
puts (10...100).include?(42) # wrong way
puts (10...100).cover?(42) # right way

# Question 6
# starting with the string...
famous_words = "seven years ago..."
# show two different ways to put the expexted "Four score and " in front of it.
puts "Question 6"
puts "-------------------------"
puts "Way 1"
way_1 = "Four score and " + famous_words
puts way_1

puts "Way 2"
way_2 = "Four score and " << famous_words
puts way_2

puts "Another way"
another_way = famous_words.prepend("Four score and ")
puts another_way

# Question 7
# What will be the result?
# "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
# 42 ((number of parenthesis * 8) + number) :P

# Question 8
# If we build an array like this:
puts "Question 8"
puts "-------------------------"
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:
# ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.
flintstones.flatten!
puts flintstones.to_s

# Question 9
# Given the hash below
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
puts "Question 9"
puts "-------------------------"
array = []              #Wrong Way
array[0] = flintstones.key(2)
array[1] = flintstones[array[0]]
puts array.to_s 
# Right way
puts flintstones.assoc("Barney").to_s

# Question 10
# Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
puts "Question 10"
puts "-------------------------"
# Turn this array into a hash where the names are the keys and the values are the positions in the array.
# My way
hash = {}
flintstones.each_with_index do |value, index|
  hash[value] = index
end
puts hash.to_s
