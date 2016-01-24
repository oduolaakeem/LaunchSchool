def reduce(array, acum = 0)
  counter = 0
  
  while counter < array.size
    current_value = array[counter]
    acum = yield(acum, current_value)
    counter += 1
  end
  
  acum
end

array = [1, 2, 3, 4, 5]

puts reduce(array) { |acc, num| acc + num }                    # => 15
puts reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass