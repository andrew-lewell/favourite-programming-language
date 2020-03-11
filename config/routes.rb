Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/find", to: "user#new"
  post "/users", to: "user#create"
  get "/users/:id", to: "user#show", as: 'user'


end
