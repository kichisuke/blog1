class BlogController < ApplicationController
  def index
    @tmp = params[:content]
    @posts = Post.all.order("created_at DESC").limit(3)
    @main_img = Post.find(10)
  end

  def blog_post
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def create
    #@posts = Post.create! params.require(:post.permit(:title, :content))
    @image = Cloudinary::Uploader.upload(params[:media],:transformation=>[
      {:width=>600, :height=>300, :crop=>"scale"}])
    @posts = params.permit(:title, :content).merge(:media => @image['secure_url'])
    Post.create(@posts)
    redirect_to :blog_post
  end

   # findメソッドで、idにひもづくPOSTオブジェクトを取得する
   def open
    @posts = Post.find(params[:id])
  end
  
end
