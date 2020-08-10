Rails.application.routes.draw do
  #devise_for :users
  post '/posts', to: 'blog#post_create'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :posts, only: [:new, :create, :index]
  root to: 'blog#index'
  get 'new_post', to: 'blog#new_post'
  post 'new_post', to: 'blog#create'
  post 'blog_post', to: 'blog#create'
  patch '/blog', to: 'blog#update'
  get 'post_image', to: 'blog#post_image'
  post 'post_image', to: 'blog#post_create'
  get 'blog', to: 'blog#blog'

  get 'blog/index'
  get 'blog/:id', to: 'blog#open'
  get 'category/:genre', to: 'blog#genre_open'
  get 'blog/:id/draft', to: 'blog#draft'
  post 'blog/:id/draft/post', to: 'blog#blog_post'
  get 'blog/:id/draft/edit', to: 'blog#draft_edit'
  
end
