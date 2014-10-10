# SIGN UP PAGE
get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.new(params[:args])
  password = params[:args][:password_hash]
# Feel free to add more password validations below
  if password.length < 6
    session[:errors] = {error: ["Password must be at least 6 characters."]}
    redirect "/signup"
  end
  if user.valid?
    user.password = password
    user.save!
    session[:user_id] = user.id
    redirect ('/')
  else
    errors = user.errors.messages
    session[:errors] = errors
    redirect "/signup"
  end
end
