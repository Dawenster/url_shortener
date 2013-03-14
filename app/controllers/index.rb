get '/' do
  erb :index
end

post '/urls' do
  # @url_error = Url.create.errors[:original_url].any?
  @url_error = Url.create(params).invalid?
  @url = Url.create(params)
  erb :urls
end

get '/user/new' do
  if session.has_key?(:user)
    erb :secret_page
  else
    redirect '/'
  end
end

post '/user/new' do
  @current_user = User.create(params[:user])
  erb :secret_page
end

get '/logout' do
  logout
  redirect '/'
end

get '/authenticate' do
  @inputted_email = params[:email]
  @inputted_password = params[:password]

  user = User.authenticate(@inputted_email, @inputted_password, session)
  if user
    redirect '/user/new'
  else
    @error = true
    erb :index
    #redirect '/'
  end
end

get '/:short_url' do
  url_object = Url.find_by_shortened_url(params[:short_url])
  return 404 unless url_object
  url_object.save
  redirect url_object.original_url
end