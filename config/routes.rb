Rails.application.routes.draw do
  root "dashboard#index"

  resources :patients do
    resources :prescriptions
  end

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
end
