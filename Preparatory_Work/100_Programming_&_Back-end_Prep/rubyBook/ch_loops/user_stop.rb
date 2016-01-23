# user_stop.rb

loop do
  puts "Type 'STOP' to stop running the program."
  answer = gets.chomp
  if answer == "STOP"
    break
  end
end
