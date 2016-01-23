# optional_parameters.rb

def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}"
  end
end

greeting("Bob")
# one way to pass the parameters when having an optional hash
greeting("Bob", {age: 62, city: "New York City"})
# another way to pass the parameters when having an optional hash
greeting("Bob", age: 62, city: "New York City")
