# # method implementation
# def test
#   yield(1, 2)
# end

# # method invocation
# test { |num| puts num }             # expecting 1 parameter in block implementation

# method implementation
def test
  yield(1)
end

# method invocation
test { |num1, num2| puts "#{num1} #{num2}" }             # expecting 1 parameter in block implementation