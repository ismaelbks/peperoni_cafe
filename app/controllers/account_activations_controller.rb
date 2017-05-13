class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      #Welcome_email
      log_in user
      flash[:success] = "Votre compte est activé. Bienvenue dans la communauté."
      redirect_to user
    else
      flash[:danger] = "Lien d'activation invalide."
      redirect_to root_url
    end
  end

end
