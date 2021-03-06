Rails.application.routes.draw do



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"


  resources :users, only: [:show] do
    resources :protests, only: [:index] do
      resources :transportations do
        resources :passengers
      end
    end
  end


  resources :protests do
    resources :attendances, only: [:create, :destroy]
  end


end
