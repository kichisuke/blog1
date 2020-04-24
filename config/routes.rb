Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index]
  root to: 'blog#index'
  get 'blog_post', to: 'blog#blog_post'
  post 'blog_post', to: 'blog#create'
  patch '/blog', to: 'blog#update'
  get 'post_image', to: 'blog#post_image'
  post 'post_image', to: 'blog#post_create'
  get 'blog', to: 'blog#blog'

  #これを上にもってこないと、blog/:idを先にみて、
  #indexというidでpostアクション  へルーティングしてしまう。
  get 'blog/index'
  # 投稿ページ表示(追加)
  get 'blog/:id', to: 'blog#open'

  get 'category/:genre', to: 'blog#genre_open'
  get 'blog/:id/draft', to: 'blog#draft'
  get 'blog/:id/draft/edit', to: 'blog#draft_edit'
  
end
