Rails.application.routes.draw do
  root "welcome#index"
  resources :articles, path: '/api/articles', only: [:index]
  post "/users", to: "users#create"
  post "/auth/login", to: "auth#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
