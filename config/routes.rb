Rails.application.routes.draw do
  
  get 'participations/index'
  root 'events#index'
  get 'static_pages/secret'
  devise_for :users
  resources :events
  resources :users 
  resources :attendances
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
