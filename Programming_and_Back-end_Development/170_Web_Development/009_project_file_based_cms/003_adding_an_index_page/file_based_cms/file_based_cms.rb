require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get '/' do
  directory = './public/files/'
  @files = Dir[directory + '*'].map { |file| file.gsub(directory, '') }
  erb :index, layout: :layout
end