enable :sessions
require 'byebug'

get '/' do
   session.clear
   session[:number] = 0
   session[:check] = 0
   erb :index
end

get '/sign_out' do
  session.clear
  redirect to ('/')
end

get '/another_round' do
  session[:number] = 0
  session[:check] = 0
  user = User.find_by_id(session[:id])
  redirect to ("/user/#{user.name}")
end

