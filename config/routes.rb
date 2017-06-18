Rails.application.routes.draw do
	root 'sessions#new'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	get '/swits/:term', to: 'swits#search', as: 'swit_search'
	resources :users, only: [:show, :edit, :update] do
		collection do
			patch 'update_password'
		end
	end
	resources :swits, only: [:index, :create, :destroy] do
		resources :comments, only: [:new, :create, :destroy]
		member do
			get 'toggle_sweet'
			get 'toggle_sour'
		end
	end
end
