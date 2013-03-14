get '/user/new' do
  if session.has_key?(:user_name)
    current_user
    user_login
    @list_of_user_urls = Url.where('user_id = ?', @current_user.id)
    erb :profile
  else
    redirect '/'
  end
end

post '/user/new' do
  @current_user = User.create(params[:user])
  current_user
  user_login
  @list_of_user_urls = []
  erb :profile
end

get '/authenticate' do
  @inputted_email = params[:email]
  @inputted_password = params[:password]

  user_truth = User.authenticate(@inputted_email, @inputted_password, session)
  current_user
  if user_truth
    redirect '/user/new'
  else
    @error = true
    erb :index
  end
end