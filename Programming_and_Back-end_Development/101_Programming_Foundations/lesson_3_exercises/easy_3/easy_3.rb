# Question 1
puts "Question 1"
puts "-------------------------"
# Show an easier way to write this array:
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts flintstones.to_s

# Question 2
puts "Question 2"
puts "-------------------------"
# How can we add the family pet "Dino" to out usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
puts flintstones.to_s

# Question 3
puts "Question 3"
puts "-------------------------"
# In the previous exercise we added Dino to our array like this:
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << "Dino"
# We could have used either Array#concat or Array#push to add Dino to the family.
# How can we add multiple items to our array? (Dino and Hoppy)
# My way
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(["Dino", "Hoppy"])
puts flintstones.to_s
# Pro way
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino").push("Hoppy")
puts flintstones.to_s

# Question 4
puts "Question 4"
puts "-------------------------"
# Shorten this sentence:
advice = "Few things in life are as important as house training your pet dinosaur."
# ...remove everything starting from "house".
# my way
advice.slice!("Few things in life are as important as ")
puts advice
# Pro way
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))
puts advice

# Question 5
puts "Question 5"
puts "-------------------------"
# Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"
# my way
puts statement.count("t")
# pro way
puts statement.scan("t").count

# Question 6
puts "Question 6"
puts "-------------------------"
# Back in the stone age (before CSS) we used spaces to align things on the screen.
# If we had a 40 character wide table of Flintstone family members, how could 
# we easily center that title above the table with spaces?
title = "Flintstone Family Members"
#pro way
puts title.center(40)