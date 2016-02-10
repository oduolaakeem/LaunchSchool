class Cipher
  LETTERS = ('a'..'z').to_a
  ENCODING_TEMPLATE = LETTERS + LETTERS
  attr_reader :key
  
  def initialize(key = nil)
    @key = key
    check_key
  end
  
  def check_key
    if @key
      fail(ArgumentError) if @key.match(/[A-Z0-9]+/) || @key.empty?
    else
      generate_random_key
    end
  end
  
  def generate_random_key
    @key = ""
    100.times { @key << LETTERS[Random.new.rand(26)] }
  end
  
  def encode(text)
    coded_text = ""
    text.each_char.with_index do |letter, index|
      shift_number = LETTERS.index(@key[index])
      coded_text << ENCODING_TEMPLATE[LETTERS.index(letter) + shift_number]
    end
    coded_text
  end
  
  def decode(text)
    decoded_text = ""
    text.each_char.with_index do |letter, index|
      shift_number = LETTERS.index(@key[index])
      decoded_text << ENCODING_TEMPLATE[LETTERS.index(letter) - shift_number]
    end
    decoded_text
  end
end