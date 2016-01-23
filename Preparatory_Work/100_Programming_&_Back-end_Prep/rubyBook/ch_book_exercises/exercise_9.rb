# exercise_9.rb

h = {a:1, b:2, c:3, d:4}

puts "1. Getting thevalue of key ':b'"
puts h[:b]

puts "2. Adding the key:value pair e:5"
h[:e] = 5
puts h

puts "3. Remove all key:value pairs whose value is less than 3.5"
h.select! { |k, v| v >= 3.5 }
puts h
