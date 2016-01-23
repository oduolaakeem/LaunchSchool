# exercise_16.rb

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
result = []

result = a.map { |value| value.split(" ") }
result.flatten!

puts result.to_s  

