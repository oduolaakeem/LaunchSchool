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

get "/search" do
  @chapters_matched = {}
  (1..12).each do |chapter|
    break unless params[:query]
    text = File.read("./data/chp#{chapter}.txt")
    puts text.downcase
    @chapters_matched[chapter] = @toc[chapter - 1] if text.downcase.include?(params[:query].downcase)
  end
  erb :search
end

not_found do
  redirect "/"
end
