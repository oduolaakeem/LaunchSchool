# # method implementation
# def increment(number)
#   number + 1
# end

# # method invocation
# increment(5)                            # => 6

# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  else
    number + 1
  end
end

# method invocation
increment(5) do |num|
  puts num
end