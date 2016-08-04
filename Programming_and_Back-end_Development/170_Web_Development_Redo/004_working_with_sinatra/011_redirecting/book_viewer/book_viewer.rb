require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @toc = IO.read("./data/toc.txt").split("\n")
end

helpers do
  def in_paragraphs(text)
    "<p>" + text.split("\n\n").join("</p><p>") + "</p>"
  end
end

get "/" do
  erb :home
end

get "/chapters/:number" do
  @chapter_number = params[:number]
  @chapter_text = File.read("./data/chp#{@chapter_number}.txt")
  erb :chapter
end

not_found do
  redirect "/"
end
