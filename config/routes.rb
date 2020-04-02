Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'blog#index'
  get 'blog_post', to: 'blog#blog_post'
  post 'blog_post', to: 'blog#create'
end
