require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubis'

helpers do
  def sort_example(list, sort_order)
    if sort_order == 'a'
      return list.sort
    elsif sort_order == 'd'
      return list.sort { |x, y| y <=> x}
    else
      return list
    end
  end
end

get "/example/:sort_order" do
  @list_example = [1,2,3,4,5,6]
  @sort_order = params[:sort_order]
  erb :example, layout: false
end

get "/teams/:team_id/players" do
  # GET /teams/:team_id/players?sort=batting
  @team_id = params[:team_id]
  "#{@team_id}, #{params['sort']}"
end

get "/route_exercise_9" do
  erb :list, layout: :wide_layout
end

get "/exercise_11" do
  @names = ["Larry", "Curly", "Moe"]
  erb :exercise_11, layout: false
end

get "/departments/:department/:product/:type" do
  department = params[:department]
  product = params[:product]
  type = params[:type]
end