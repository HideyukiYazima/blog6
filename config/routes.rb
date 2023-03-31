Rails.application.routes.draw do
  get 'home/top'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"

  get "/" => "home#top"


  resources :posts
  get 'search', to: 'posts#search', as: 'search_posts'
end
