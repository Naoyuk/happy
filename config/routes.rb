Rails.application.routes.draw do
  get 'days/new' => 'days#new'
  get 'posts/index' => 'posts#index'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'

  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  post 'days/create' => 'days#create'

  get "/" => "home#top"
  get "/about" => "home#about"
end
