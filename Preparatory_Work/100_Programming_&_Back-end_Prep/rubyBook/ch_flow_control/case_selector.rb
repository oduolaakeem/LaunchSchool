# case_selector.rb

def case_selector(text)
  text_length = text.length
  if text_length > 10
    return text.upcase
  else
    return text
  end
end

puts "Enter some text: "
text = gets.chomp

puts case_selector(text)
