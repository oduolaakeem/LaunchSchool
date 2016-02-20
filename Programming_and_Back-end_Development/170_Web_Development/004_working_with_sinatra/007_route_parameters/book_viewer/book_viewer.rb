require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  # File.read "public/template.html"
  @contents = File.readlines("data/toc.txt")
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:number" do
  @title = "Chapter #{params[:number]}"
  @contents = File.readlines("data/toc.txt")
  @chapter = File.read("data/chp#{params[:number]}.txt")
  erb :chapter
end
