class BlogController < ApplicationController
  def index
    @blogs = Blog.where(draft: 0).order("created_at DESC").limit(3)
    #@main_img = Blog.find(10) 
    @posts = Post.all.order("created_at DESC").limit(3)
  end

  def blog
    @blogs = Blog.where(draft: 0).order("created_at DESC").page(params[:page]).per(10)
    @category = Blog.where.not(genre: nil)
  end

  def blog_post
  end

  def draft
    @blogs = Blog.find(params[:id])
  end

  def draft_edit
    @blogs = Blog.find(params[:id])
  end  

  def post_image
    @post = Post.new
    @image = Post.all.order("created_at DESC").limit(12)
  end

  def post_create
    @image = Cloudinary::Uploader.upload(params[:image],:transformation=>[
      {:width=>370, :height=>200, :crop=>"scale"}])
    @post = Post.create(post_create_params)
    if @post.save
      redirect_to :post_image
    else
      render "layouts/_new"
    end  
  end

  def create
    @image = Cloudinary::Uploader.upload(params[:media],:transformation=>[
      {:width=>600, :height=>300, :crop=>"scale"}])
    newData = Blog.create(create_params)
    id = newData.id
    name = '/blog/' + id.to_s + '/draft'
    redirect_to name
  end

  def update
    @image = Cloudinary::Uploader.upload(params[:blog][:media],:transformation=>[
      {:width=>600, :height=>300, :crop=>"scale"}]) unless params[:blog][:media].blank?
    newData = Blog.find(params[:blog][:id]).update(update_create_params)
    name = '/blog/' + params[:blog][:id] + '/draft'
    redirect_to name
  end

  def open
    @blogs = Blog.find(params[:id])
  end

  def genre_open
    @blogs = Blog.where(genre: params[:genre]).page(params[:page]).per(10)
    @category = Blog.where.not(genre: nil)
  end

  private
  def create_params
    params.permit(:title, :content).merge(:media => @image['secure_url'], draft: "1")
  end

  def update_create_params
    params[:title] = params[:blog][:title]
    params[:content] = params[:blog][:content]
    @image.blank? ? params.permit(:title, :content).merge(draft: "1") : params.permit(:title, :content).merge(:media => @image['secure_url'], draft: "1")
  end

  def post_create_params
    params.permit(:title, :image).merge(:image => @image['secure_url'])
  end
  
end
