Rails.application.routes.draw do
  get 'chatrooms', to: 'chatrooms#index'
	root 'welcome#about'
get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"

  get 'login', to: "sessions#new"
  get 'users', to: 'users#new'

resources :chatrooms, param: :slug

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
