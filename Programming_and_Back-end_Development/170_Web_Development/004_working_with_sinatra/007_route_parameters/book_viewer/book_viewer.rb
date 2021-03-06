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
  @contents = File.readlines("data/toc.txt")
  @chapter = File.read("data/chp#{params[:number]}.txt")
  
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"
  
  erb :chapter
end
