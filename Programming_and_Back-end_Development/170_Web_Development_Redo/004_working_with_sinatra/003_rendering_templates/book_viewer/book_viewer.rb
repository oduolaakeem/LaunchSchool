require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = "Bookshelf"
  erb :home
end
