def select(array)
  counter = 0
  new_array = []
  
  while counter < array.size
    if yield(array[counter])
      new_array << array[counter]
    end
    counter += 1
  end
  
  new_array
end

puts select([1, 2, 3, 4, 5]) { |num| num.odd? }.to_s
puts select([1, 2, 3, 4, 5]) { |num| puts num }.to_s
puts select([1, 2, 3, 4, 5]) { |num| num + 1 }.to_s