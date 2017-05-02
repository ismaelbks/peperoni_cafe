class PagesController < ApplicationController
  def home
  	@title = 'Accueil'
  end

  def contact
  	@title = 'Contact'
  end

  def edit
  	@title = 'Editing Profile'
  end
  
end
