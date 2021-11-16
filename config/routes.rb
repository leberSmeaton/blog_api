Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/categories", to: "categories#index", as: "categories"
  get "/posts", to: "posts#index", as: "posts"
  get "/posts/:id", to: "posts#show", as: "post"
  post "/auth/login", to: "auth#login", as: "login"
  post "/auth/register", to: "auth#register", as: "register"
end
