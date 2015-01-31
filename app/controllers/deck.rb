get '/deck/:id' do
    @deck = Deck.find_by_id( params[:id])
    @question =  Card.where(deck_id: params[:id])
    @number =  session[:number]
    if @question[@number] == nil
      @statistic = Gue.last
      erb :finish
    else
      erb :question
    end
end

get '/statistic/deck/:id' do
    @user = User.find_by_id(session[:id])
    @deck = Deck.find_by_id(params[:id])
    @round = @user.rounds.where(user_id: session[:id] , name: @deck.name)
    round_id = Array.new
    @round.each { |x|  round_id << x.id }
    @statistic = Gue.where(round_id: [round_id])
    erb :statistic
end


post '/deck/:deck_id/card/:card_id' do
  @deck = Deck.find_by_id( params[:deck_id])
  @question = Card.where(deck_id: params[:deck_id])

  if session[:check] == 0
    @user = User.find_by_id(session[:id])
    @round = @user.rounds.create(name: @deck.name)
    @guess = @round.gues.create()
    session[:check] = 1
  end

  @guess = Gue.last
  if params[:answer] == @question[session[:number]].answer
    session[:number] += 1
    @guess.update_attributes(correct: (@guess.correct + 1))
  else
    @guess.update_attributes(wrong: (@guess.wrong + 1))
  end

  redirect to ("/deck/#{params[:deck_id]}")
end