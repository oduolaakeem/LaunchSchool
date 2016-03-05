require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

root = File.expand_path('..', __FILE__)

get '/' do
  @files = Dir.glob(root + '/data/*').map { |path| File.basename(path) }
  erb :index, layout: :layout
end

get '/:file' do
  path = root + '/data/' + params[:file]
  headers["Content-Type"] = "text/plain"

  @file_text = File.open(path).read
end