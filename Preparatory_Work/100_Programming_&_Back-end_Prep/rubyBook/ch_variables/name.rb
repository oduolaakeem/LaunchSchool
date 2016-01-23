# name.rb

#name = gets.chop
puts "What is your first name?"
first_name = gets.chop
puts "What is your last name?"
last_name = gets.chop

#put the name together
name = first_name + " " + last_name

puts "Welcome #{name} "

10.times do |n|
  puts name
end
