Rails.application.routes.draw do
  resources :purchases, only: [:index]
  resources :donations
  resources :book_genres
  resources :book_authors
  resources :addresses
  resources :id_tags
  resources :genres
  resources :image_links
  resources :books
  resources :authors
  resources :users
  get '/auth', to: 'auth#persist'
  post '/login', to: 'auth#login'
  get '/available-books', to: 'books#available'
  get '/get/:id', to: 'purchases#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
