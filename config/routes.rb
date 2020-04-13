Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index]
  root to: 'blog#index'
  get 'blog_post', to: 'blog#blog_post'
  post 'blog_post', to: 'blog#create'
  get 'post_image', to: 'blog#post_image'
  post 'post_image', to: 'blog#post_create'
  get 'blog', to: 'blog#blog'

  #これを上にもってこないと、blog/:idを先にみて、
  #indexというidでpostアクションへルーティングしてしまう。
  get 'blog/index'
  # 投稿ページ表示(追加)
  get 'blog/:id', to: 'blog#open'

  get 'category/:genre', to: 'blog#genre_open'
  
end
