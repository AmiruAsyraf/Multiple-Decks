enable :sessions

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
    redirect to("/#{@account.name}")
  else
    redirect to ("/")
  end
end

get '/deck/:deck' do
    @deck = Deck.find_by_name(params[:deck])
    @question = Card.find(:all, :conditions =>  ["deck_id = ?", @deck.id])
    @number =  session[:number]
    session[:id] = @deck.id
    erb :question
end

get '/next/new' do
    @deck = Deck.find_by_id(session[:id])
    @question = Card.find(:all, :conditions =>  ["deck_id = ?", session[:id]])
    @number =  session[:number]
    if @question[@number] == nil
      erb :finish
    else
      erb :question
    end
end

get '/:name' do
    @details = User.find_by_name(params[:name])
    @decks = Deck.all

    erb :login
end

post '/answer' do
  p session[:number]

  @question = Card.find(:all, :conditions =>  ["deck_id = ?", session[:id]])

  p @question
  @question[session[:number]].answer

  if params[:answer] == @question[session[:number]].answer
    session[:number] += 1
  end

    redirect to ("/next/new")
end


