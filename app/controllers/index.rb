# LOG IN PAGE

get '/' do
  erb :index
end

post '/' do
  user = User.find_by(email: params[:email])
  if user
    if User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
    else
    session[:errors] = {error: ["Invalid Password."]}
    end
  else
    session[:errors] = {error: ["Username not found. Create an account."]}
  end
  redirect '/'
end

get '/:id' do
  @user = User.find(params[:id])
  erb :show_profile
end

get '/:id/edit' do
  @user = User.find(params[:id])
  erb :edit
end

patch '/:id' do
  user = User.find(params[:id])
  if user.update(params[:args])

  else
    errors = user.errors.messages
    session[:errors] = errors
    redirect "/#{user.id}/edit"
  end
end


post '/logout/' do
  session.clear
  session[:errors] = {notice: ["Goodbye. Good luck out there."]}
  redirect '/'
end


