Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/" => "posts#index"

  get "posts/:id" => "posts#show"


  resources :posts
  get 'search', to: 'posts#search', as: 'search_posts'
end
