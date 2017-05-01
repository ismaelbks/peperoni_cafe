Rails.application.routes.draw do
  root 'pages#home'

  get 'pages/home'

  get 'pages/contact'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
