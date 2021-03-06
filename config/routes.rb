Rails.application.routes.draw do



  get 'callbacks/google'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :registrations => "users/registrations" }
  root "users#index"

  resources :users do 
    resources :reviews, :only => [:index, :show]
  end

  resources :schools do 
    resources :reviews
    resources :bookmarks, only: [:create, :update, :destroy]
  end 

  resource :session, :only => [:new, :create, :destroy]
  resources :schools, only: [:index, :show]
  resources :comparisons, :only => [:index]

  get "login" => "devise/sessions#new"
  get "logout" => "devise/sessions#destroy"


end
