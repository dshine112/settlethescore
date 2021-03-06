get '/confrontation/new' do
  if session[:user_id]
    @users = User.all
    erb :'confrontation/new'
  else
    redirect '/login'
  end
end

get '/confrontation/:id' do |id|
  @confrontation = Confrontation.find(id)
  erb :'confrontation/confrontation'
end

post '/confrontation' do
  user = User.find(params[:confrontation][:user_id])
  @confrontation = user.confrontations.create(params[:confrontation])
  @confrontation.create_rebuttal(params[:opponent])
  @confrontation.create_tags(params[:tags])
  erb :'confrontation/confrontation'
end
