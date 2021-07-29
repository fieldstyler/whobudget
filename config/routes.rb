Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  # resoures :savings
  get '/savings/new', to: "savings#new"
  post '/savings/new', to: "savings#create"
  post '/savings/create', to: "savings#create"
end
