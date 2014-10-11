def show_queue
  FutureBachelorette.where(status: "open")[1..10].map do |block|
  # FutureBachelorette.all.map do |block|
    User.find(block.user_id)
  end
end

def show_bachelorette
  User.find(FutureBachelorette.find_by(status: "open").user_id)
end

def current_user
  User.find_by(id: session[:user_id])
end

def show_proposals
  Proposal.where(recipient_id: current_user.id)
end

def has_already_proposed?
  Proposal.find_by(sender_id: session[:user_id])
end

def logged_in?
  session[:user_id]
end

def the_bachelorette?
  current_user == show_bachelorette
end

def on_active_list?
  FutureBachelorette.find_by(user_id: session[:user_id], status: "open")
end
