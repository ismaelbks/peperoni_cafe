class UsersController < ApplicationController

	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user,     only: [:destroy]

	def index
		@users = User.all
		@title = "Tous les utilisateurs"
		@users = User.paginate(page: params[:page])
	end


	def show
		@user = User.find(params[:id])
		@title = 'Profil'
	end

	def new
		@user = User.new
		@title = 'Nouveau Profil'
	end

	def create
	  	@user = User.new(user_params)
  		if @user.save
  			UserMailer.account_activation(@user).deliver_now
        flash[:info] = "Verifie tes emails pour activer ton compte."
        redirect_to root_url
  		else
    		render :new
  		end
	end

		#Fonctionnalité à remettre plus tard !
		#log_in @user
		#flash[:success] = "Bienvenue parmi les Péperoner !"
        #UserMailer.welcome_email(@user).deliver_later
        #session[:user_id] = @user.id
        #redirect_to root_path

	def edit
    	@user = User.find(params[:id])
    	@title = 'Edition Profil'
  	end

	def update
		@user = User.find(params[:id])
  	   if @user.update_attributes(user_params)
   		    flash[:success] = "Informations mises à jour."
   		    redirect_to user_url     		
  	   else
    		  render 'edit'
  	   end
	end


  #before_filter


   # Confirms the correct user.
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Un péperoner parti trop tôt ..."
    redirect_to root_url
  end


	
	private


  	  def user_params
  		    params.require(:user).permit(:name, :email, :password, :password_confirmation, :pseudo, :last_name, :phone_number)
  	  end



end