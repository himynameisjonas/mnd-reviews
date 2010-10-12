class SessionsController < ApplicationController
  def create
    auth = request.env['rack.auth']
    # render :text => auth.to_yaml
    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user
    
    redirect_to(root_path, :notice =>  "Välkommen, #{current_user.name}.")
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end