require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @files = Dir.glob("public/*")
  temp = []
  @files.each do |file|
    temp << file.split("/")[1]
  end
  @files = temp
  @files.sort!
  @files.reverse! if params[:sort] == "desc"
  erb :home
end