require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
end

before do
  #assign the initial $100 for new users of the application
  session[:money] ||= 100
end

get "/" do
  erb :index, layout: false
end

def check_input_bet?(number)
  return false if number <= 0 || number > session[:money]
  true
end

post "/make_bet" do
  if session[:money] == 0
    redirect "/broke"
    halt
  end
  
  bet = params["bet"].to_i
  guess = params["guess"].to_i
  
  if check_input_bet?(bet)
    rnd_number = rand(1..3)
    if guess == rnd_number
      session[:money] += bet
      session[:message] = "You have guessed correctly."
    else
      session[:money] -= bet
      session[:message] = "You guessed #{guess}, but the number was #{rnd_number}."
      if session[:money] == 0
        redirect "/broke"
      halt
      end
    end
  else
    session[:message] = "Bets must be between $1 and #{session[:money]}."
  end
  
  redirect "/"
end

get "/broke" do
  "<p>You have lost all your money</p><a href='/restart'>Start over.</a>"
end

get "/restart" do
  session[:money] = 100
  redirect "/"
end