Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show]

  get "/item/id", to: "items#show"

end
