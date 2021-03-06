require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret' 
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# GET   /lists          -> view all lists
# GET   /lists/new      -> new list form
# POST  /lists          -> create new list
# GET   /lists/1        -> view a single list

# View list of lists
get "/lists" do
  @lists = session[:lists]
  
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Create a new list
post "/lists" do
  list_name = params[:list_name].strip
  # if list_name.size >= 1 && list_name.size <= 100
  if (1..100).cover? list_name.size
    session[:lists] << {name: list_name, todos: []}
    session[:success] = "The list has been created."
    redirect "/lists"
  else
    session[:error] = "The list name must be between 1 and 100 characters."
    erb :new_list, layout: :layout
  end
end