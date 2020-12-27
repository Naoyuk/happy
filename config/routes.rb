Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  post 'posts/create'
  get 'posts/edit'
  post 'posts/update'
  delete 'posts/destroy'
  
  get "/" => "home#top"
  get "/about" => "home#about"
end
