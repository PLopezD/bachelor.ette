# SIGN UP PAGE
get '/user/signup' do
  erb :signup
end

post '/user/signup' do
  user = User.new(params[:args])
  password = params[:args][:password_hash]
# Feel free to add more password validations below
  if password.length < 6
    session[:messages] = {error: ["Password must be at least 6 characters."]}
    redirect "/user/signup"
  end
  if user.valid?
    user.password = password
    user.save!
    session[:user_id] = user.id
    redirect ('/')
  else
    errors = user.errors.messages
    session[:messages] = errors
    redirect "/user/signup"
  end
end
