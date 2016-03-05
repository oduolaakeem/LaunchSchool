require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get '/' do
  directory = './data/'
  @files = Dir[directory + '*'].map { |file| file.gsub(directory, '') }
  erb :index, layout: :layout
end

get '/:file' do
  path = './data/' + params[:file]
  headers["Content-Type"] = "text/plain"

  @file_text = File.open(path).read
end