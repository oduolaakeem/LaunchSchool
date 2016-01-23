# greeting.rb

def greeting(name)
  puts "Welcome #{name}"
end

puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp

name = first_name + " " + last_name

greeting(name)
