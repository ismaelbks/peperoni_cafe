class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # Case (1)     

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Un email vient d'être envoyé avec les instructions."
      redirect_to root_url
    else
      flash.now[:danger] = "L'adresse entrée ne correspond à rien."
      render 'new'
    end
  end

  def edit
  end

  #Met à jour le mot de passe
  def update
    if params[:user][:password].empty?                  # Case (3)
      @user.errors.add(:password, "Ne doit pas être vide")
      render 'edit'
    elsif @user.update_attributes(user_params)          # Case (4)
      log_in @user
      flash[:success] = "Le mot de passe a bien été modifié."
      redirect_to @user
    else
      render 'edit'                                     # Case (2)
    end
  end  


  private

      def user_params
        params.require(:user).permit(:password, :password_confirmation)
      end


    # Before filters

      #find the corresponding user
      def get_user
        @user = User.find_by(email: params[:email])
      end

      # Confirms a valid user.
      def valid_user
        unless (@user && @user.activated? &&
                @user.authenticated?(:reset, params[:id]))
          redirect_to root_url
        end
      end

      #check if the link hasn't expired
      def check_expiration
        if @user.password_reset_expired?
          flash[:danger] = "Le lien de modification est expiré."
          redirect_to new_password_reset_url
        end
      end
end
