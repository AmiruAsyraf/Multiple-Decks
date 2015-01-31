post '/login' do
  user = User.authenticate(params[:post])

  if user
    session[:id] = user.id
    redirect to("/user/#{user.name}")
  else
    redirect to ("/")
  end
end

get '/user/:name' do
    @details = User.find_by_id(session[:id])
    @decks = Deck.all
    erb :personal
end




