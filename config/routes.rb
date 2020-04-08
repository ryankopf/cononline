Rails.application.routes.draw do
  resources :attendees
  resources :products
  resources :vendors
  resources :users

  get '/', to: 'pages:index'
end
