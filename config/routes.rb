Rails.application.routes.draw do
  devise_for :users
  
  root 'home#top'
  get "/about" => "home#about"

  get 'days/new' => 'days#new'
  get 'posts/index'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'

  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  post 'days/create' => 'days#create'

end
