Rails.application.routes.draw do

  namespace :admin do
    root "static_pages#home"
    resources :subjects
    resources :users
  end
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "contribute" => "static_pages#contribute"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "signup" => "users#new"
  resources :users
end
