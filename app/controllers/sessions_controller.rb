class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      redirect_to '/pages/home'
      flash[:success] = "C'est bon de te revoir, #{@user.name.capitalize} !"
    else
    # If user's login doesn't work, send them back to the login form.
      flash.now[:danger] = 'Mauvaise combinaison email & mot de passe' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end