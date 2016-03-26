require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'redcarpet'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path('../test/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)
  end
end

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
    erb render_markdown(content)
  end
end

get '/' do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map { |path| File.basename(path) }
  session[:user] || session[:user] = nil
  @user = session[:user]
  erb :index, layout: :layout
end

get '/new' do
  erb :new, layout: :layout
end

get '/:file' do
  path = File.join(data_path, params[:file])
  
  if File.exist?(path)
    load_file_content(path)    
  else
    session[:error] = "#{params[:file]} does not exist."
    redirect "/"
  end
end

get '/:file/edit' do
  path = File.join(data_path, params[:file])
  @content = load_file_content(path)
  headers['Content-Type'] = 'text/html;charset=utf-8'
  erb :file_edit, layout: :layout
end

post '/:file/edit' do
  path = File.join(data_path, params[:file]) 
  file = File.open(path, "w")
  file.write(params[:file_content])
  file.close
  session[:success] = "#{params[:file]} was updated."
  redirect '/'
end

def valid_file_name?
  path = File.join(data_path, params[:file_name])
  File.extname(path) != "" && File.basename(path)[0] != "."
end

post '/create' do
  if valid_file_name?
    path = File.join(data_path, params[:file_name]) 
    File.new(path, "w+")
    session[:success] = "#{params[:file_name]} was created."
    redirect '/'
  else
    session[:error] = "Please enter a valid name, and dont forget the extension."
    erb :new, layout: :layout
  end
end

post '/:file/delete' do
  path = File.join(data_path, params[:file])
  File.delete(path)
  session[:success] = "The file #{params[:file]} has been deleted."
  redirect "/"
end

get '/users/signin' do
  erb :user_signin, layout: :layout
end

def valid_login?(username, password)
  if username == "admin" && password == "secret"
    true
  else
    false
  end
end

post '/users/signin' do
  username = params[:username]
  password = params[:password]
  if valid_login?(username, password)
    session[:user] = username
    session[:password] = password
    session[:success] = "Welcome!"
    redirect '/'
  else
    session[:error] = "Please input the right username and password to login."
    erb :user_signin, layout: :layout
  end
end

post '/users/signout' do
  session.delete(:user)
  session.delete(:password)
  session[:success] = "Successfully signed out."
  redirect '/'
end