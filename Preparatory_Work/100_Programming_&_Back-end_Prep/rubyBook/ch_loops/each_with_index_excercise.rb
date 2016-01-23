# each_with_index_excercise.rb

backpack = ["Computer", "Notepad", "Hardrive"]

backpack.each_with_index do |object, index|
  puts "#{index + 1}. #{object}"
end
