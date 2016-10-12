Rails.application.routes.draw do

  namespace :admin do
    resources :subjects
    root "subjects#index"
    resources :questions
    resources :subjects do
      resources :questions
    end
    resources :users
  end
  root "exams#index"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "contribute" => "static_pages#contribute"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "signup" => "users#new"
  resources :users
  resources :exams

end
