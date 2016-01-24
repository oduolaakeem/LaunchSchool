def hello
  "hello!"
end

hello                 # => "hello!"
#hello("hi")          # => ArgumentError
hello { puts "hi" }   # => "hello!"