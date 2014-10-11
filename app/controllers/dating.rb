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

  redirect '/'
end


# Bachelorette checks out the potential suiter's profile
get '/accept/:proposal_id' do
  @proposer = Proposal.find(params[:proposal_id]).sender
  @proposal_id = params[:proposal_id]
  erb:'accept_proposal'
end

post '/accept' do
  proposal = Proposal.find(params[:proposal_id])
  DateNotification.create(user: User.find(proposal.sender_id), status: "unread")
  DateNotification.create(user: User.find(proposal.recipient_id), status: "unread")
  Hookup.create(sender_id: proposal.sender_id, recipient_id: proposal.recipient_id, description: proposal.description)
  place_in_line = FutureBachelorette.find_by(status: "open")
  place_in_line.update(status: "closed")
  Proposal.delete_all
  redirect '/congratulations'
end

get '/congratulations' do
  erb :congratulations
end

get '/:id/dates' do
  date_notification?.update(status: "read") if date_notification?
  @dates = all_dates
  erb :dates
end

post '/futurebachelorette' do
  FutureBachelorette.create(user_id: session[:user_id], status: "open")
  session[:messages] = {message: ["Welcome to the party!"]}
  redirect '/'
end
