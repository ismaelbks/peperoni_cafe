class UserMailer < ApplicationMailer

  default from: 'no-reply@peperoni-cafe.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://peperoni-cafe.herokuapp.com/login'
    mail to: user.email, subject: 'Bienvenue sur le Peperoni Cafe'
  end

  def account_activation(user)
  	@user = user
  	mail to: @user.email, subject: 'Activer ton compte peperoni'
  end

  def password_reset(user)
  	@user = user
  	@greeting = "Hi"
    mail to: "to@example.org"
  end
end

