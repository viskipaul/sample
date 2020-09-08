Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  resources :users
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
  get '/microposts/:id' => 'microposts#destroy'
  resources :microposts,          only: [:create, :destroy]
end