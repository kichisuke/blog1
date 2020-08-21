class BlogController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action{@pref = Blog.where.not(pref_name: "").distinct.pluck(:pref_name)}
  before_action{@category = Blog.where.not(genre: "").pluck(:genre)}

  def index
    @blog = Blog.where(draft: 0).order("created_at DESC").page(params[:page]).per(5)
    @p_blog = Blog.where(draft: 0).order("created_at DESC").limit(3)
    @posts = Post.all.order("created_at DESC").limit(3)
  end

  def blog
    @blogs = Blog.where(draft: 0).order("created_at DESC").page(params[:page]).per(10)
    @arr_category = Blog.where.not(genre: "").pluck(:genre)
  end

  def blog_post
    postData = Blog.find(params[:id]).update(post_param)
    name = '/blog/' + params[:id].to_s
    redirect_to name
  end
  
  def new_post
    #@blog = Blog.new
  end

  def draft
    @blogs = Blog.find(params[:id])
  end

  def draft_edit
    @blog = Blog.find(params[:id])
  end  

  #def post_image
  #  count = Post.where.not(image:nil).count
  #  count <= 16 ? count = count : count = 16
  #  @post = Post.new
  #  @image = Post.all.order("created_at DESC").limit(count)
  #end

  #def post_create
  #  @image = Cloudinary::Uploader.upload(params[:post][:image],:transformation=>[
  #    {:width=>370, :height=>200, :crop=>"scale"}]) if !params[:post][:image].nil?
  #  @post = Post.create(post_create_params)
  #  if @post.save
  #    redirect_to :post_image
  #  else
  #    count = Post.where.not(image:nil).count
  #    count <= 16 ? count = count : count = 16
  #    @image = Post.all.order("created_at DESC").limit(count)
  #    render "post_image"
  #  end  
  #end

  def create
    @image = Cloudinary::Uploader.upload(params[:media],:transformation=>[
      {:width=>600, :height=>300, :crop=>"scale"}]) if !params[:media].nil?
    newData = Blog.create(create_params)
    id = newData.id
    name = '/blog/' + id.to_s + '/draft'
    redirect_to name
  end

  def update
    @blog = Blog.find(params[:blog][:id])
    @image = Cloudinary::Uploader.upload(params[:blog][:media],:transformation=>[
      {:width=>600, :height=>300, :crop=>"scale"}]) unless params[:blog][:media].blank?
    newData = @blog.update(update_create_params)
    name = '/blog/' + params[:blog][:id] + '/draft'
    redirect_to name
  end

  def open
    @blogs = Blog.find(params[:id])
  end

  def genre_open
    @blogs = Blog.where(genre: params[:genre]).page(params[:page]).per(10)
    @arr_category = Blog.where.not(genre: nil).pluck(:genre)
  end

  def city_open
    @blogs = Blog.where(city_name: params[:city_name]).page(params[:page]).per(10)
    @arr_category = Blog.where.not(genre: nil).pluck(:genre)
  end

  def draft_open
    @blogs = Blog.where(draft: 1)
  end

  def destroy
    @blogs = Blog.find(params[:id])
    @blogs.destroy
    redirect_to "/"
  end

  private
  def create_params
    @image.blank? ? params.permit(:title, :genre, :city_name, :content).merge(draft: "1") : params.permit(:title, :genre, :city_name, :content).merge(:media => @image['secure_url'], draft: "1") 
  end

  def update_create_params
    params[:title] = params[:blog][:title]
    params[:genre] = params[:blog][:genre]
    params[:city_name] = params[:blog][:city_name]
    params[:content] = params[:blog][:content]
    @image.blank? ? params.permit(:title, :genre, :city_name, :content).merge(draft: "1") : params.permit(:title, :genre, :city_name, :content).merge(:media => @image['secure_url'], draft: "1")
  end

  def post_create_params
    params[:title] = params[:post][:title]
    params[:post][:image].blank? ? params.permit(:title) : params.permit(:title, :image).merge(:image => @image['secure_url'])
  end

  def post_param
    params.permit(:id).merge(draft: "0")
  end
  
end
