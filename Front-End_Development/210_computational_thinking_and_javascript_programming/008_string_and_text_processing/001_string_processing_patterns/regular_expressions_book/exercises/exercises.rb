# Exercise 1

def url?(string)
  !!string.match(/\Ahttps?:\/\/\S+\z/)
end

puts('Exercise 1')
puts(url?('http://launchschool.com'))   # -> true
puts(url?('https://example.com'))       # -> true
puts(url?('https://example.com hello')) # -> false
puts(url?('   https://example.com'))    # -> false

# Exercise 2

def fields(text)
  text.split(/[,\s]+/)
end

puts('Exercise 2')

puts(fields("Pete,201,Student").to_s)
# -> ['Pete', '201', 'Student']

puts(fields("Pete \t 201    ,  TA").to_s)
# -> ['Pete', '201', 'TA']

puts(fields("Pete \t 201").to_s)
# -> ['Pete', '201'']

# Exercise 3

def mystery_math(text)
  text.sub(/[+\-\/*]/, '?')
end

puts('Exercise 3')

puts(mystery_math('4 + 3 - 5 = 2'))
# -> '4 ? 3 - 5 = 2'

puts(mystery_math('(4 * 3 + 2) / 7 - 1 = 1'))
# -> '(4 ? 3 + 2) / 7 - 1 = 1'

# Exercise 4

def mysterious_math(text)
  text.gsub(/[+\-*\/]/, '?')
end

puts('Exercise 4')

puts(mysterious_math('4 + 3 - 5 = 2'))           # -> '4 ? 3 ? 5 = 2'
puts(mysterious_math('(4 * 3 + 2) / 7 - 1 = 1')) # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'

# Exercise 5

def danish(text)
  text.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

puts('Exercise 5')

puts(danish('An apple a day keeps the doctor away'))
  # -> 'An danish a day keeps the doctor away'

puts(danish('My favorite is blueberry pie'))
# -> 'My favorite is danish pie'

puts(danish('The cherry of my eye'))
# -> 'The danish of my eye'

puts(danish('apple. cherry. blueberry.'))
# -> 'danish. cherry. blueberry.'

puts(danish('I love pineapple'))
# -> 'I love pineapple'

