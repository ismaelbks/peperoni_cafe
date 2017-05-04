class UserMailer < ApplicationMailer

  default from: 'ismael.boukhars@peperoni-cafe.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://peperoni-cafe.herokuapp.com/login'
    mail(to: @user.email, subject: 'Bienvenue sur le Peperoni Cafe')
  end


end

