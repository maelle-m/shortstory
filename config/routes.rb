Rails.application.routes.draw do
  get 'home/index'
  resources :stories, only: [:new, :create, :show]

  get 'openai/index', as: :openai_index

  root 'home#index'

  get "up" => "rails/health#show", as: :rails_health_check
end
