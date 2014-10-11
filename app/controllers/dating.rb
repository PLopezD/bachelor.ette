# Potential suiter makes proposal to bachelorette
get '/propose' do
  erb :propose
end

post '/propose' do
  proposal = Proposal.new(description: params[:proposal], sender_id: session[:user_id], recipient_id: show_bachelorette.id)

  if proposal.valid?
    proposal.save!
    session[:messages] = {message: ["Cupid's arrow moves swiftly."]}
  else
    errors = proposal.errors.messages
    session[:messages] = errors
  end
  
  redirect "/"
end


# Bachelorette checks out the potential suiter's profile
get "/accept/:id" do
  @user = Proposal.find(params[:id]).sender

  erb:'show_profile'
end