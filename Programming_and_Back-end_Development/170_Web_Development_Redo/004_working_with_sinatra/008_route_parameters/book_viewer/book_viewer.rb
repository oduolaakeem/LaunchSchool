require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

def load_chapters()
  IO.read("./data/toc.txt").split("\n")
end

get "/" do
  @toc = load_chapters()
  erb :home
end

get "/chapters/:number" do
  @toc= load_chapters()
  @chapter_number = params[:number]
  @chapter_text = File.read("./data/chp#{@chapter_number}.txt")
  erb :chapter
end
