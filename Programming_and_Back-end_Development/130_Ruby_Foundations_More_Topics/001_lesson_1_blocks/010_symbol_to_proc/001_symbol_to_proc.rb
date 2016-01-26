puts [1, 2, 3, 4, 5].map { |num| num.to_s }.to_s

puts [1, 2, 3, 4, 5].map(&:to_s).to_s

puts :to_s.to_proc

def my_method
  yield(2)
end

# turns the symbol into a Proc, then & turns the Proc into a block
my_method(&:to_s)               # => "2"


def my_method
  yield(2)
end

a_proc = :to_s.to_proc          # explicitly call to_proc on the symbol
my_method(&a_proc)              # convert Proc into block, then pass block in. Returns "2"