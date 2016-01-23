# exercise_5.rb

array = [1, 2, 3, 5, 6, 7, 8, 9, 10]

array.push(11)
array.unshift(0)

puts array.to_s

array.pop

array << 3

puts array.to_s

puts "Making the array unique..."

unique_array = array.uniq()

puts unique_array.to_s
