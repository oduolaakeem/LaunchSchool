def measure_time_to_do_a_task
  time_before = Time.now
  yield
  time_after = Time.now
  
  puts "It took #{time_after - time_before} seconds to run your block."
end

# Time to print my name char by char
measure_time_to_do_a_task do
  "Lucas".each_char { |char| print char }
  puts ""
end