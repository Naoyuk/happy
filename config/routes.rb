Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/edit'
  get 'posts/new'
  get 'posts/:id' => 'posts#show'

  post 'posts/create'
  post 'posts/update'
  
  delete 'posts/destroy'

  get "/" => "home#top"
  get "/about" => "home#about"
end
