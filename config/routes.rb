Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  resources :history, only: [:index]
  resources :stats, only: [:index]
  
  
  resources :lists do
    resources :items do
      member do
        put :toggle_done
      end  
    end
  end
end
