Rails.application.routes.draw do
	root 'sessions#new'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	get '/change_pass', to: 'users#edit_pass'
	post 'update_pass', to: 'users#update_pass'
	resources :users, only: :show
	resources :swits, only: [:index, :create, :destroy]
end
