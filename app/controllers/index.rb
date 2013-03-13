get '/' do
  erb :index
end

post '/urls' do
  @errors = Url.create.errors[:original_url].any?
  @url = Url.create(params).invalid?
  erb :urls
end

get '/:short_url' do
  url_object = Url.find_by_shortened_url(params[:short_url])
  return 404 unless url_object
  url_object.save
  redirect url_object.original_url
end

