class PagesController < ApplicationController
  def home
  	@title = 'Accueil'
  end

  def prestations
  	@title = 'Prestations'
  end

  def contact
  	@title = 'Contact'
  end
end
