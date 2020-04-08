Rails.application.routes.draw do
  resources :attendees
  resources :products
  resources :vendors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
