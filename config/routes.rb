Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :savings, except: [:show]
  # get '/savings/new', to: "savings#new"
  # post '/savings/new', to: "savings#create"
  post '/savings/create', to: "savings#create"
  get '/savings/:id/edit', to: "savings#edit"
  patch '/savings/:id/edit', to: "savings#update"

  resources :expense, except: [:show]
  get '/expense/index', to: "expense#index"
  post '/expense/create', to: "expense#create"
  # resources :expense
end
