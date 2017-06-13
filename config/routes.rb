Rails.application.routes.draw do
	root 'sessions#new'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	resources :users, only: [:show, :edit, :update]
	resources :swits, only: [:index, :create, :destroy]
	resources :comments, only: [:index, :create, :destroy]
end
