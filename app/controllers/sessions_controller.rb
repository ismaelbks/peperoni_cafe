class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        if user.activated?
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_back_or user
        else
          message  = "Compte en attente d'activation. "
          message += "Vérifie tes mails pour l'activer."
          flash[:warning] = message
          redirect_to root_url
        end
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