class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session_email])

    if user&.authenticate(params[:session_password])
      log_in(user) # defined in session_helper.rb
      remember(user)
      @gossips = Gossip.all
      @likes = Like.all
      redirect_to :home, success: "Welcome #{user.first_name}. You are now successfully logged in."
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out(current_user)
    @gossips = Gossip.all
    flash.now[:info] = 'You logged out successfully'
    redirect_to :home
  end
end
