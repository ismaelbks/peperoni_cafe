Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  get 'pages/contact'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
