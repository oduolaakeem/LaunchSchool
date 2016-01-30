class Atbash
  FIRST_13_LETTERS = ('a'..'m').to_a
  LAST_13_LETTERS = ('n'..'z').to_a.reverse
  
  def self.encode(word)
    encoded = ""
    word = word.gsub(/\s|\W/, "").downcase
    word.each_char do |char|
      if FIRST_13_LETTERS.include? char
        encoded << LAST_13_LETTERS[FIRST_13_LETTERS.index(char)]
      elsif LAST_13_LETTERS.include? char
        encoded << FIRST_13_LETTERS[LAST_13_LETTERS.index(char)]
      else
        encoded << char
      end
    end
    encoded = encoded.scan(/\w{5}/) << encoded.gsub(encoded.scan(/\w{5}/).join, "")
    encoded.select { |encoded_word| !encoded_word.empty? }.join(" ")
  end
end