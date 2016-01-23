# excercises.rb
# Chapter: Basics

# 1. Add two strings together.
puts "Lucas" + "Ochoa"

# 2. Use modulo operator, division, or a combination to find the thousands, hundreds, tens and the ones.
number = 4395
numberCopy = number

thousands = number / 1000
number = number % 1000

hundreds = number / 100
number = number % 100

tens = number / 10
number = number % 10

ones = number

puts "The number " + numberCopy.to_s + " have: "
puts "Thousands equal to: " + thousands.to_s
puts "Hundreds equal to: " + hundreds.to_s
puts "Tens equal to: " + tens.to_s
puts "Ones equal to: " + ones.to_s

# 3. Hash excercise. Create a hash to store the movie titles with the year they came out.

movies = {jaws: 1975,
          anchorman: 2004,
          man_of_steel: 2013,
          a_beautiful_mind: 2001,
          the_evil_dead: 1981}

puts movies[:jaws]
puts movies[:anchorman]
puts movies[:man_of_steel]
puts movies[:a_beautiful_mind]
puts movies[:the_evil_dead]

# 4. Store the dates above in an array, then ouput them.

movies_dates = [movies[:jaws], 
	       movies[:anchorman],
               movies[:man_of_steel],
               movies[:a_beautiful_mind],
	       movies[:the_evil_dead],
               ]

puts movies_dates[0]
puts movies_dates[1]
puts movies_dates[2]
puts movies_dates[3]
puts movies_dates[4]

# 5. Write a program that ouputs the factorial of the numbers 5, 6, 7 and 8

puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

# 6. Write a program that calculates the squares of 3 float numbers of your choosing and ouput the result to the screen.

number1 = 3.5
number2 = 4.5
number3 = 6.75

puts number1 * number1 
puts number2 * number2 
puts number3 * number3

 








