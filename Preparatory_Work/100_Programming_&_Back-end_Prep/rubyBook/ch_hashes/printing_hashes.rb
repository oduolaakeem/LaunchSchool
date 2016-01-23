# printing_hashes.rb

hash = {a: 1, b: 2, c: 3, d: 4}

puts "\n Printing the keys: "

hash.each {|k, v| puts k}

puts "\n Printing the values: "

hash.each {|k, v| puts v}

puts "\n Printing the keys and the values"

hash.each {|k, v| puts "Key: #{k}, Value: #{v}\n"}
