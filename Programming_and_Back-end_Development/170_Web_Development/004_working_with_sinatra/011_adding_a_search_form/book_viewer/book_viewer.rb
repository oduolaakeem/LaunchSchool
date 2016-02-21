require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "pry"

before do
  @contents = File.readlines("data/toc.txt")
end

helpers do
  def in_paragraphs(text)
    paragraph_number = 0
    text.split("\n\n").map do |line|
      paragraph_number += 1
      "<p id=\"#{paragraph_number}\">#{line}</p>"
    end.join
  end
  
  def in_paragraphs_without_p_tag(text)
    paragraphs_hash = {}
    paragraph_number = 0
    text.split("\n\n").each do |line|
      paragraph_number += 1
      paragraphs_hash[paragraph_number] = line
    end
    paragraphs_hash
  end
  
  def highlight_result(text)
    text.gsub(params[:query], "<strong>#{params[:query]}</strong>")
  end
end

not_found do
  redirect "/"
end

get "/" do
  # File.read "public/template.html"
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:number" do
  @chapter = File.read("data/chp#{params[:number]}.txt")
  
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"
  
  erb :chapter
end

get "/search" do
  @chapters_list = {
    :chapter_number => [],
    :chapter_title => [],
    :paragraph_number => [],
    :paragraph_text => []
  }
  if params[:query]
    @contents.each_with_index do |chapter_title, index|
      chapter_paragraphs = File.read("data/chp#{index + 1}.txt")
      chapter_paragraphs = in_paragraphs_without_p_tag(chapter_paragraphs)
      chapter_paragraphs.each_pair do |paragraph, text|
        if text.include?(params[:query])
          @chapters_list[:chapter_number] << index + 1
          @chapters_list[:chapter_title] << chapter_title
          @chapters_list[:paragraph_number] << paragraph
          @chapters_list[:paragraph_text] << highlight_result(text)
        end
      end
    end
  end
  erb :search
end

get "/test" do
  request.path_info
end