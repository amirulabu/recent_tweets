enable :session
get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/tweet' do
  erb :tweet
end

post '/tweet' do
  $client.update(params[:tweet])

"/tweets/amirulabu?refresh=1"
end




get '/tweets/:username' do
  @user = User.find_by_username(params[:username])
  ## what if the username is not in the database
  if @user.nil?
    @user =  User.create(username: params[:username])
    @user.fetch_tweets!
  end

  if @user.tweets_stale? or params[:refresh] == "1"
    @user.delete_tweets!
    @user.fetch_tweets!
  end

  @tweets = @user.twittertexts
  erb :username
end

post '/tweets' do
  redirect to('/tweets/' + params[:username])
end





