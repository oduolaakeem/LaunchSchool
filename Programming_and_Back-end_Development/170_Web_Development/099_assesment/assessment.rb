get "/teams/:team_id/players" do
  # GET /teams/:team_id/players?sort=batting
  @team_id = params[:team_id]
  "#{@team_id}, #{params['sort']}"
end

get "/route_exercise_9" do
  erb :list, layout: :wide_layout
end