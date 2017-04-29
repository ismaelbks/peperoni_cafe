class PagesController < ApplicationController
  def home
  	@title = 'Accueil'
  end

  def espace_perso
  	@title = 'Espace Perso'
  end

  def contact
  	@title = 'Contact'
  end
end
