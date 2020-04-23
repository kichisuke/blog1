class BlogController < ApplicationController
  def index
    # @tmp = params[:content]
    @blogs = Blog.all.order("created_at DESC").limit(3)
    @main_img = Blog.find(10)
    @posts = Post.all.order("created_at DESC").limit(3)
  end

  def blog
    @blogs = Blog.all.order("created_at DESC").page(params[:page]).per(10)
    @category = Blog.where.not(genre: nil)
  end

  def blog_post
  end

  def post_image
    @image = Post.all.order("created_at DESC").limit(10)
  end

  def post_create
    @image = Cloudinary::Uploader.upload(params[:image],:transformation=>[
      {:width=>370, :height=>200, :crop=>"scale"}])
    Post.create(post_create_params)
    redirect_to :post_image
  end

  def create
    #@posts = Post.create! params.require(:post.permit(:title, :content))
    @image = Cloudinary::Uploader.upload(params[:media],:transformation=>[
      {:width=>600, :height=>300, :crop=>"scale"}])
    # @blogs = params.permit(:title, :content).merge(:media => @image['secure_url'])
    #Blog.create(@blogs)
    Blog.create(create_params)
    redirect_to :blog_post
  end

   # findメソッドで、idにひもづくPOSTオブジェクトを取得する
  def open
    @blogs = Blog.find(params[:id])
  end

  def genre_open
    @blogs = Blog.where(genre: params[:genre]).page(params[:page]).per(10)
    @category = Blog.where.not(genre: nil)
  end

  private
  def create_params
    params.permit(:title, :content).merge(:media => @image['secure_url'])
  end

  def post_create_params
    params.permit(:title, :image).merge(:image => @image['secure_url'])
  end
  
end
