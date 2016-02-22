require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'
require 'pry'

# USERS_INFO = nil

before do
  USERS_INFO = YAML.load_file("data/users.yml")
  @users = USERS_INFO.keys.map! { |user| user.to_s }
end

helpers do
  def number_of_users
    @users.count.to_s + " users"
  end
  
  def number_of_interests
    total = 0
    @users.each do |user|
      total += USERS_INFO[user.to_sym][:interests].count
    end
    total.to_s + " interests"
  end
end

get "/" do
  @title = "Welcome"
  erb :home
end

get "/users/:user" do
  @user = params[:user]
  @title = @user.capitalize
  @email = USERS_INFO[@user.to_sym][:email]
  @interests = USERS_INFO[@user.to_sym][:interests]

  erb :user
end

