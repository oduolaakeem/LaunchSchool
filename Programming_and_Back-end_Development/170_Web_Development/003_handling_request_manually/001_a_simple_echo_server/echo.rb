# echo.rb

require 'socket'

server = TCPServer.new("localhost", 8080)
loop do
  client = server.accept
  
  request_line = client.gets
  puts request_line
  
  client.puts request_line
  client.puts rand(6) + 1
  
  client.close
end