class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # If the user exists AND the password entered is correct.    
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)

      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      redirect_to root_url
      flash[:success] = "C'est bon de te revoir, #{user.name.capitalize} !"
    else
    # If user's login doesn't work, send them back to the login form.
      flash.now[:danger] = 'Mauvaise combinaison email & mot de passe' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end