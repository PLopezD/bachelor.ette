def show_queue
  FutureBachelorette.where(status: "open").limit(10).map do |block|
    User.find(block.id)
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