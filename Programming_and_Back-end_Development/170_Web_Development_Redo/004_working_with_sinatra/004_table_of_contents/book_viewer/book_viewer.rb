require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @toc = IO.read("./data/toc.txt").split("\n")
  erb :home
end
