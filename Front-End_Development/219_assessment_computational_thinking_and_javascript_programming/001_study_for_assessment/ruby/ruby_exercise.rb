# Ruby exercise
require 'pry'

def century(year)
  puts (((year - 1) / 100) + 1)
end


def substrings(string)
  i = 0
  array = []
  loop do
    binding.pry
    j = 1
    loop do
      array << string.slice(i, j)
      
      j += 1
      break if i + j > string.length
    end
    
    i += 1
    break if i == string.length
  end
  
  puts array
end

substrings('abcde')