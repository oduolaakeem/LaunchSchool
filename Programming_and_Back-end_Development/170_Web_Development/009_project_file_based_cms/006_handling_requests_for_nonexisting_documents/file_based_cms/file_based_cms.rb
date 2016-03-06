require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'

root = File.expand_path('..', __FILE__)

configure do
  enable :sessions
  set :session_secret, 'secret'
end

get '/' do
  @files = Dir.glob(root + '/data/*').map { |path| File.basename(path) }
  erb :index, layout: :layout
end

get '/:file' do
  @files = Dir.glob(root + '/data/*').map { |path| File.basename(path) }
  path = root + '/data/' + params[:file]
  headers["Content-Type"] = "text/plain"
  
  if @files.include?(params[:file])
    @file_text = File.open(path).read
  else
    session[:error] = "#{params[:file]} does not exist."
    redirect "/"
  end
end