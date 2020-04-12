Rails.application.routes.draw do
  resources :attendees
  resources :products
  resources :vendors
  resources :users

  get '/', to: 'pages#index'
  get '/about', to: 'pages#about'
  get '/privacy', to: 'pages#privacy'
  get '/terms', to: 'pages#terms'
  get '/dealers', to: 'vendors#index', category: 'dealer'
  get '/artists', to: 'vendors#index', category: 'artist'

  get '/signup', to: 'users#new'
  get '/pending', to: 'users#pending'
  get '/forgot', to: 'users#reset'

  get '/login/:id/:key', to: 'login#login'
  post '/logout', to: 'login#logout'
  get '/vendor/approve/:id', to: 'vendors#approve'
  get '/vendor/disapprove/:id', to: 'vendors#approve'
end
