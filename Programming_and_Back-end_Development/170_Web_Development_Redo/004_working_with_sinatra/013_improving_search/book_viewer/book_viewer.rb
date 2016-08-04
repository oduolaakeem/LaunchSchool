require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @toc = IO.read("./data/toc.txt").split("\n")
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |paragraph, index|
      "<p id=#{index}>" + paragraph + "</p>"
    end.join
  end
  
  def highlight(text)
    text.gsub(params[:query], "<strong>#{params[:query]}</strong>")
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
  @paragraphs_matched = {}
  (1..12).each do |chapter|
    break unless params[:query]
    text = File.read("./data/chp#{chapter}.txt")
    puts text.downcase
    if text.downcase.include?(params[:query].downcase)
      @chapters_matched[chapter] = @toc[chapter - 1]
      @paragraphs_matched[chapter] = []
      text.split("\n\n").each_with_index do |paragraph, index|
        if paragraph.downcase.include?(params[:query].downcase)
          @paragraphs_matched[chapter] << [index, paragraph]
        end
      end
    end
  end
  erb :search
end

not_found do
  redirect "/"
end
