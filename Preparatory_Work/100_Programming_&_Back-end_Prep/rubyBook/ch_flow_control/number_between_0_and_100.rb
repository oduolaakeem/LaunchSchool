# number_between_0_and_100.rb

puts "Enter a number between 0 and 100: "
number = gets.chomp.to_i

if (number >= 0) && (number <= 50)
  puts "The number is between 0 and 50."
elsif (number > 50) && (number <= 100)
  puts "The number is between 51 and 100."
elsif (number > 100)
  puts "The number is above 100."
end

puts "****************************"
puts "Now with methods"
puts "****************************"

def eval_num_using_if(number)
  if number < 0
    puts "You cant enter negative numbers."
  elsif (number >= 0) && (number <= 50)
    puts "#{number} is between 0 and 50."
  elsif (number > 50) && (number <= 100)
    puts "#{number} is between 51 and 100."
  else
    puts "#{number} is above 100."
  end
end

def eval_num_using_case(number)
  case
  when number < 0
    puts "You cant enter negative numbers."
  when number <= 50
    puts "#{number} is between 0 and 50."
  when number <= 100
    puts "#{number} is between 51 and 100."
  when number > 100
    puts "#{number} is above 100."
  end
end

puts "Calling method using if statements..."
eval_num_using_if(number)
puts "***********"
puts "Calling method using case statements..."
eval_num_using_case(number)
