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

get "/chapters/1" do
  @toc= load_chapters()
  @chapter_number = "1"
  @chapter_text = File.read("./data/chp1.txt")
  erb :chapter
end
