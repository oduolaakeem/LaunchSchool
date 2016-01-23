# exercise_2.rb

array = [1, 2, 3, 5, 6, 7, 8, 9, 10]

array_selected = array.select { |val| val > 5 }

array_selected.each { |val| puts val }
