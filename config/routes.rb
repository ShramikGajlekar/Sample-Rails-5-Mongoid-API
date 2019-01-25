Rails.application.routes.draw do
  devise_for :users
  
  namespace :api do
  	scope module: :v1 do
  		resources :addresses
  		resources :sessions, only: [:create]
      resources :posts
      resources :comments
  		delete 'destroy_session', to: 'sessions#destroy_session'
  		get 'show_user_data', to: 'users#show_user_data'
      post 'sign_up', to: 'registrations#create'
  	end	
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
