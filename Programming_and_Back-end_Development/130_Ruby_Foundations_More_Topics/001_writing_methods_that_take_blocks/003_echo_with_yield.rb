def echo_with_yield(str)
  yield if block_given?
  str
end

#echo_with_yield { puts "world" }                       # => ArgumentError: wrong number of arguments (0 for 1)
echo_with_yield("hello!") { puts "world" }              # world
                                                        # => "hello!"
#echo_with_yield("hello", "world!") { puts "world" }    # => ArgumentError: wrong number of arguments (2 for 1)
echo_with_yield("hello")                                # => LocalJumpError: noblock given (yield)