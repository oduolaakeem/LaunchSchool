# countdown_recursion.rb

def countdown_rec(counter)
  if counter == 0
    puts counter
  else
   puts counter 
   countdown_rec(counter - 1)
  end
end

puts "Input a number to start counting down: "
counter = gets.chomp.to_i
countdown_rec(counter)
