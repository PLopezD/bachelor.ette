# LOG IN PAGE

get '/' do
  erb :index
end

post '/' do
  user = User.find_by(email: params[:email])
  if user
    if user.authenticate(params[:password])
      session[:user_id] = user.id
    else
    session[:messages] = {error: ["Invalid Password."]}
    end
  else
    session[:messages] = {error: ["Email not found. Create an account."]}
  end
  redirect '/'
end

get '/:id' do
  @user = User.find(params[:id])
  erb :show_profile
end

get '/:id/edit' do
  @user = User.find(params[:id])
  erb :edit_profile
end

patch '/:id' do
  user = User.find(params[:id])
  if user.update(params[:args])
    redirect "/#{user.id}"
  else
    errors = user.errors.messages
    session[:messages] = errors
    redirect "/#{user.id}/edit"
  end
end

delete '/:id' do
  user = User.find(params[:id])
  user.destroy
  session.clear
  session[:messages] = {message: ["We are sorry to see you go. We hope it's because you found love."]}
  redirect '/'
end

post '/logout/' do
  session.clear
  session[:messages] = {notice: ["Goodbye. Good luck out there."]}
  redirect '/'
end


