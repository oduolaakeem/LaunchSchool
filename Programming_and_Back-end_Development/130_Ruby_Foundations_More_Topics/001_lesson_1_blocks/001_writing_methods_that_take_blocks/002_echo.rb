def echo(str)
  str
end

echo                                          # => ArgumentError: wrong number of arguments (0 for 1)
echo("hello!")                                # => "hello!"
echo("hello", "world!")                       # => ArgumentError: wrong number of arguments (2 for 1)

# this time, called with an implicit block
echo { puts "world" }                         # => ArgumentError: wrong number of arguments (0 for 1)
echo("hello!") { puts "world" }               # => "hello!"
echo("hello", "world!") { puts "world" }      # => ArgumentError: wrong number of arguments (2 for 1)