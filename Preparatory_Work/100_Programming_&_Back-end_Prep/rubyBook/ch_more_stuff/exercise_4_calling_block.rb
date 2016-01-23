# exercise_4_calling_block.rb

def execute(number, &block)
  puts number
  block.call
end

execute 4 do
    puts "Hello from inside the execute method!"
end
