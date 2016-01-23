# perform_again.rb

# do...while using a regular loop
#loop do
#  puts "Do you want to do that again? (Y/N)"
#  answer = gets.chomp
#  if answer != "Y"
#    break
#  end
#end


# do...while using a begin...while structure. This way works but it is not recommended by Matz, the creator of Ruby.
begin
  puts "Do you want to do that again? (Y/N)"
  answer = gets.chomp
end while answer == 'Y'
