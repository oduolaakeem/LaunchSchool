require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'redcarpet'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

root = File.expand_path('..', __FILE__)

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when '.txt'
    headers["Content-Type"] = "text/plain"
    content
  when '.md'
    render_markdown(content)
  end
end

get '/' do
  @files = Dir.glob(root + '/data/*').map { |path| File.basename(path) }
  erb :index, layout: :layout
end

get '/:file' do
  path = root + '/data/' + params[:file]
  
  if File.exist?(path)
    load_file_content(path)    
  else
    session[:error] = "#{params[:file]} does not exist."
    redirect "/"
  end
end

get '/:file/edit' do
  path = root + '/data/' + params[:file]
  @content = load_file_content(path)
  headers['Content-Type'] = 'text/html;charset=utf-8'
  erb :file_edit, layout: :layout
end

post '/:file/edit' do
  path = root + '/data/' + params[:file]
  file = File.open(path, "w")
  file.write(params[:file_content])
  file.close
  session[:success] = "#{params[:file]} was updated."
  redirect '/'
end