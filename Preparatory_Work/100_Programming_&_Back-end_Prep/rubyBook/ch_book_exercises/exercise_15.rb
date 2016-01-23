# exercise_15.rb

puts "Original array: "

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
puts arr.to_s

arr.delete_if { |word| word.start_with?('s') }

puts "Deleting all the words that start with 's':"
puts arr.to_s

puts "Original array: "

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
puts arr.to_s

arr.delete_if { |word| word.start_with?("w")}

puts "Deleting all the words that start with 'w'"
puts arr.to_s
