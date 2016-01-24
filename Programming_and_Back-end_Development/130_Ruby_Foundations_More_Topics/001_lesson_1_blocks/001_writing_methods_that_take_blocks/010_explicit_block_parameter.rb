def test(&block)
  puts "Whta's &block? #{block}"
end

test { sleep(1) }