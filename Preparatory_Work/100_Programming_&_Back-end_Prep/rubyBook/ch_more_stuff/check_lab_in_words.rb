# check_lab_in_words.rb

def check_word(word, chars_to_check)
  # Way 1, using method inlude? from String class
  #if word.include?(chars_to_check)
  # Way 2, using regex
  if /lab/ =~ word
    puts word
  else
    puts "No Match."
  end
end

word_array = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
chars_to_check = "lab"

word_array.each do |word|
  check_word(word, chars_to_check)
end
