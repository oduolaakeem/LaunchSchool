# conditional_loop.rb

# using regular loop structurte.
#i = 0
#
#loop do
#  i += 2
#  puts i
#  if i == 10
#    break
#  end
#end

# while loop with if
x = 0

while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end
