Rails.application.routes.draw do
  root 'pages#home'

  get 'home/contact'

  get 'pages/home'

  get 'pages/espace_perso'

  get 'pages/contact'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
