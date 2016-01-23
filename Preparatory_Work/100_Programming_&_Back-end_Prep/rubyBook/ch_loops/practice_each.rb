# practice_each.rb

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
x = 1

# By convention use "{}" when everything fits in one line.
#names.each { |name| puts name }

# By convention use do/end when you need multiline blocks.
names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end

