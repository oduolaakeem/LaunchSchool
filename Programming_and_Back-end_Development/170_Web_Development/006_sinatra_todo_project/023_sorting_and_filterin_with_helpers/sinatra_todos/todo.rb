require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  session[:lists] ||= []
end

helpers do
  def list_complete?(list)
    todos_count(list) > 0 && todos_remaining_count(list) == 0
  end
  
  def list_class(list)
    'complete' if list_complete?(list)
  end
  
  def todos_remaining_count(list)
    list[:todos].count { |todo| !todo[:complete] }
  end
  
  def todos_count(list)
    list[:todos].size
  end
  
  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_complete?(list) }
    
    incomplete_lists.each { |list| yield list, lists.index(list) }
    complete_lists.each { |list| yield list, lists.index(list) }
  end
  
  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:complete] }
    
    incomplete_todos.each { |todo| yield todo, todos.index(todo) }
    complete_todos.each { |todo| yield todo, todos.index(todo) }
  end
end

get '/' do
  redirect '/lists'
end

# GET   /lists          -> view all lists
# GET   /lists/new      -> new list form
# POST  /lists          -> create new list
# GET   /lists/1        -> view a single list

# View list of lists
get '/lists' do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get '/lists/new' do
  erb :new_list, layout: :layout
end

# Return an error message if the name is invalid. Return nil if name is valid.
def error_for_list_name(name)
  if !(1..100).cover? name.size
    'List name must be between 1 and 100 characters.'
  elsif session[:lists].any? { |list| list[:name] == name }
    'List name must be unique.'
  end
end

# Create a new list
post '/lists' do
  list_name = params[:list_name].strip

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = 'The list has been created.'
    redirect '/lists'
  end
end

# View a single todo list.
get '/lists/:id' do
  @list_id = params[:id].to_i
  @list = session[:lists][@list_id]
  erb :list, layout: :layout
end

# Edit an existing todo list.
get '/lists/:id/edit' do
  @list_id = params[:id].to_i
  @list = session[:lists][@list_id]
  erb :edit_list, layout: :layout
end

# Update and existing todo list.
post '/lists/:id' do
  @list_id = params[:id].to_i
  @list = session[:lists][@list_id]
  list_name = params[:list_name].strip
  
  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = 'The list has been updated.'
    redirect "/lists/#{@list_id}"
  end
end

# Delete an existing todo list
post '/lists/:id/destroy' do
  id = params[:id].to_i
  @list = session[:lists][id]
  session[:lists].delete(@list)
  session[:success] = "The list '#{@list[:name]}' has been deleted."
  redirect "/"
end

# Return an error message if the todo name is invalid.
def error_for_todo(id, name)
  if !(1..100).cover? name.size
    'Todo must be between 1 and 100 characters.'
  end
end

# Add todo items to an existing todo list.
post '/lists/:list_id/todos' do
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]
  todo = params[:todo].strip
  
  error = error_for_todo(@list_id, todo)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << {name: todo, complete: false}
    session[:success] = 'Todo activity added successfully.'
    erb :list, layout: :layout
  end
end

# Delete a todo item from a todo list.
post '/lists/:list_id/todos/:todo_id/destroy' do
  @list_id = params[:list_id].to_i
  todo_id = params[:todo_id].to_i
  @list = session[:lists][@list_id]
  
  @list[:todos].delete_at(todo_id)
  session[:success] = 'The todo has been deleted.'
  erb :list, layout: :layout
end

# Mark items as completed or not completed
post '/lists/:list_id/todos/:todo_id/check' do
  @list_id = params[:list_id].to_i
  todo_id = params[:todo_id].to_i
  @list = session[:lists][@list_id]
  
  is_completed = params[:completed] == 'true'
  @list[:todos][todo_id][:complete] = is_completed
  
  session[:success] = 'The todo has been updated.'
  redirect "/lists/#{@list_id}"
end

# Mark all the itmes as completed in a todo list
post '/lists/:list_id/complete_all' do
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]
  
  @list[:todos].each { |todo| todo[:complete] = true }
  session[:success] = 'All todo activities are completed.'
  redirect "/lists/#{@list_id}"
end
