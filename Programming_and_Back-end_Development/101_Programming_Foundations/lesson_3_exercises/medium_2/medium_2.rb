# Question 1
puts "Question 1"
puts "-------------------------"
# Hashes are commonly found to be more complex than the simple one we saw earlier:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# It is often the case that each key points to another hash instead of a single value:
munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" } 
}
# figure out the total age of just the male members of the family.
total_age = 0
munsters.each do |name, details|
  total_age += details["age"] if details["gender"] == "male"
end
puts "the total age of the male members of the family is: #{total_age}"

# Question 2
puts "Question 2"
puts "-------------------------"
# One of the most frequently used real-world string properties is that of "string substitution", where 
# we take a hard-coded string and modify it with various parameter from our program.
# Given this previously seen family hash, print out the name, age and gender of each family member:
munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# ...like this:
# (Name) is a (age) year old (male or female).
munsters.each { |name, details| puts "#{name} is a #{details["age"]} year old #{details["gender"]}." }

# Question 3
puts "Question 3"
puts "-------------------------"
# In an earlier exercise we saw that depending on variables to be modified by called methods
# can be tricky:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# We learned that when the above "coincidentally" does what we think we wanted "depends" upon what is going on inside
# the method.
# How can we refactor this exercise to make the result easier to predict and easier for the next programmer to maintain?
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 4
puts "Question 4"
puts "-------------------------"
# A common idiom used to solve the string conondrum is to use the String#split in conjuction with Array#join methods
# to break our string up and then put it back together again.
# Use this technique to break up the following string and put it back together with the words in reverse order.
sentence = "Humpty Dumpty sat on a wall."
puts sentence.split.reverse.join(' ')
# the correct way
puts sentence.split(/\W/).reverse.join(" ") + "."

# Question 5
puts "Question 5"
puts "-------------------------"
# What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
# 42 - 8 = 34

# Question 6
puts "Question 6"
puts "-------------------------"
# One day Spot was playing with the Munster family's home computer and he wrote a small program with their demographic data:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following... and before Grandpa could stop him, he hit the Enter key with his tail:
puts mess_with_demographics(munsters)
puts munsters
# Did the family's data get ransacked, or did the mischief only mangle a local copy of the original hash? why?
# It is only a local copy of the hash, the data is safe. This because the operations used inside the method are not
# destructive. WRONG!! actually the munsters hash is modified!!! To solve the issue, you should copy the hash inside
# the method before operate with it.

# Question 7
puts "Question 7"
puts "-------------------------"
# Method calls can take expressions as arguments. Suppose we define a function called 
# rps as follows, which follows the classic rules of rock-paper-scissors game, but 
# with a slight twist that it declares whatever hand was used in the tie as the result of that tie.
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
# what is the result of the following call?
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# it prints: paper

# Question 8
puts "Question 8"
puts "-------------------------"
# Consider these two simple methods:
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
# what would be the output of this code:
puts bar(foo)
# the code will return "no"