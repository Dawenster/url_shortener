post '/urls' do
  # @url_error = Url.create.errors[:original_url].any?
  @url_error = Url.create(params).invalid?
  @url = Url.create(params)
  erb :urls
end

get '/url/:short_url' do
  url_object = Url.find_by_shortened_url(params[:short_url])
  return 404 unless url_object
  url_object.save
  redirect url_object.original_url
end