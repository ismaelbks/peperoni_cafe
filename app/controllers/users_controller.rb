class UsersController < ApplicationController

	def new
		@user = User.new
		@title = 'Nouveau Profil'
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	  	flash[:success] = "Bienvenue parmis les Péperoner !"
        UserMailer.welcome_email(@user).deliver_later
	    session[:user_id] = @user.id
        redirect_to root_path, notice: 'User was successfully created.'
	  else
        render :new
	  end
	end

	def show
		@user = User.find(params[:id])
		@title = 'Profil'
	end


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



	
	private

		def user_params
		  params.require(:user).permit(:name, :email, :password, :password_confirmation, :pseudo, :last_name, :phone_number)
		end

end