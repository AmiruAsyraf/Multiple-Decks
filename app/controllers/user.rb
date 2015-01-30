enable :sessions
require 'byebug'

get '/' do
   session.clear
   session[:number] = 0
  # Look in app/views/index.erb
   erb :index
end

get '/sign_out' do
  session.clear
  redirect to ('/')
end

post '/login' do
  @check = params[:post]
  @account = User.find_by_password(@check["password"])
  if @account
    session[:id] = @account.id
    redirect to("/user/#{@account.id}")
  else
    redirect to ("/")
  end
end

get '/deck/:id' do
    @deck = Deck.find_by_id( params[:id])
    @question =  Card.where(deck_id: params[:id])
    @number =  session[:number]
    session[:id] = params[:id]
    if @question[@number] == nil
      erb :finish
    else
      erb :question
    end
end

get '/user/:id' do
    @details = User.find_by_id(params[:id])
    @decks = Deck.all
    erb :login
end

post '/deck/:deck_id/card/:card_id' do
  @question = Card.where(deck_id: session[:id])
  if params[:answer] == @question[session[:number]].answer
    session[:number] += 1
  end
    redirect to ("/deck/#{params[:deck_id]}")
end


