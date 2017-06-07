Rails.application.routes.draw do
	root 'sessions#new'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	# get '/swits', to: 

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# resources :users, except: [:new, :create]
	# resources :sessions, except: [:new, :edit, :update, :destroy]
	resources :swits, except: [:edit, :update]
end
