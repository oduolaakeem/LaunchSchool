require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

USERS_INFO = YAML.load_file("data/users.yml")

get "/" do
  USERS_INFO.to_s
end