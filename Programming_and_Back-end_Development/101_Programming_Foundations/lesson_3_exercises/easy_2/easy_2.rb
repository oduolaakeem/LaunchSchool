# exercises: easy_1

# Question 1
# In this hash of people and their age,
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if ther is an age present for "Spot"
puts "Question 1"
puts "-------------------------"
ages.has_key?("Spot") ? puts(ages["Spot"]) : puts("Not found!")
# other ways...
ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot")

# Question 2
# Add up all of the ages from our current Munster family hash
puts "Question 2"
puts "-------------------------"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# My Way
ages_total = 0
ages.each_value { |value| ages_total += value }
puts ages_total
# Pro Way
ages_total = ages.values.inject(:+)
puts ages_total

# Question 3
# In the hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw the really old people (age 100 or older)
puts "Question 3"
puts "-------------------------"
# My way
ages_copy = ages
ages_copy.each_key { |key| ages[key] >= 100 ? ages.delete(key) : next }
puts ages.to_s
# Pro Way
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if { |name, age| age < 100 }
puts ages.to_s

# Question 4
puts "Question 4"
puts "-------------------------"
# Starting with this string:
munsters_description = "The Munsters are creepy in a good way."
# convert the string in the following ways (code will be executed on original munsters_description above):
# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

# Question 5
puts "Question 5"
puts "-------------------------"
# We have most of the Munster family in out age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# My way
ages.merge!(additional_ages)
puts ages.to_s

# Question 6
puts "Question 6"
puts "-------------------------"
# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts ages.values.min

# Question 7
puts "Question 7"
puts "-------------------------"
# See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."
# My Way
advice.include?("Dino") ? puts("included") : puts("not included")
# Pro Way
advice.match("Dino") ? puts("included") : puts("not included")

# Question 8
puts "Question 8"
puts "-------------------------"
# In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the firs name that starts with "Be"
# My way
flintstones.each_with_index do |name, index|
  if name.start_with?("Be")
    puts "The index of the first name that starts with 'Be' is #{index}"
  end
end
# Pro way
puts "The index of the first name that starts with 'Be' is #{flintstones.index { |name| name[0, 2] == "Be"}}"

# Question 9
puts "Question 9"
puts "-------------------------"
# Using array#map!, shorten each of the names to just 3 characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name=name[0, 3] }
puts flintstones.to_s

# Question 10
puts "Question 10"
puts "-------------------------"
# Again, shorten each of these names to just 3 characters--but this time do it all on one line:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name=name[0, 3] }
puts flintstones.to_s