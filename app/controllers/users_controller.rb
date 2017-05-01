class UsersController < ApplicationController

	def new
	end

	def create
	  user = User.new(user_params)
	  if user.save
	  	flash[:success] = "Bienvenue dans notre communauté !"
        UserMailer.welcome_email(user).deliver_later
	    session[:user_id] = user.id
        redirect_to root_path, notice: 'User was successfully created.'
	  else
        render :new
	  end
	end


	def edit
    	@user = User.find(params[:id])
  	end

  	def update
  		user = User.find(params[:id])
    	if @user.update_attributes(user_params)
     		redirect_to root_path, notice: 'User was successfully created.'
    	else
      		render 'edit'
    	end
  	end
	
	private

	def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, :pseudo, :last_name, :phone_number)
	end

end