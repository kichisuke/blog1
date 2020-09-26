class BlogController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action{@food = Blog.where.not(food_name: "", draft: "1").distinct.pluck(:food_name)}
  before_action{@pref = Blog.where.not(pref_name: "", draft: "1").distinct.pluck(:pref_name)}
  before_action{@category = Blog.where.not(genre: "", draft: "1").pluck(:genre)}

  def index
    @blog = Blog.where(draft: 0).order("created_at DESC").page(params[:page]).per(5)
    @p_blog = Blog.joins(:likes).order("likes.id desc").limit(3).distinct
    @posts = Post.all.order("created_at DESC").limit(3)
  end

  def blog
    @blogs = Blog.where(draft: 0).order("created_at DESC").page(params[:page]).per(10)
    @arr_category = Blog.where.not(genre: "", draft: "1").pluck(:genre)
  end

  def blog_post
    postData = Blog.find(params[:id]).update(post_param)
    name = '/blog/' + params[:id].to_s
    redirect_to name
  end

  def comment_post
    @comment = Comment.create(comment_params)
    name = '/blog/' + params[:id]
    redirect_to name
  end

  def comment_delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    @url = request.url.split("/")[4]
    name = '/blog/' + @url
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
    @image = params[:media]
    #File.binwrite("app/assets/images/#{@image.original_filename}", @image.read) unless params[:blog][:media].blank?
    #@image = "#{@image.original_filename}" unless params[:blog][:media].blank?
    #@image = Cloudinary::Uploader.upload(params[:media],:transformation=>[
    #  {:width=>600, :height=>300, :crop=>"scale"}]) if !params[:media].nil?
    newData = Blog.create(create_params)
    #id = newData.id
    id = Blog.order(updated_at: :desc).limit(1).ids
    id2 = id.to_s.delete("[")
    id3 = id2.delete("]")
    name = '/blog/' + id3 + '/draft'
    redirect_to name
  end

  def update
    @blog = Blog.find(params[:blog][:id])
    @image = params[:blog][:media]
    #File.binwrite("app/assets/images/#{@image.original_filename}", @image.read) unless params[:blog][:media].blank?
    #@image = "#{@image.original_filename}" unless params[:blog][:media].blank?
    #@image = Cloudinary::Uploader.upload(params[:blog][:media],:transformation=>[
    #  {:width=>600, :height=>300, :crop=>"scale"}]) unless params[:blog][:media].blank?
    newData = @blog.update(update_create_params)
    name = '/blog/' + params[:blog][:id] + '/draft'
    redirect_to name
  end

  def open
    @blogs = Blog.find(params[:id])
    @comment = Comment.where(blog_id: params[:id])
    @alreadylike = Like.find_by(ip: request.remote_ip, blog_id: params[:id])
    @flag = ""
    if @alreadylike
      @flag = "already"
    else
      @flag = "not"
      @like = Like.create(blog_id: params[:blog_id], ip: request.remote_ip)
    end
  end

  def genre_open
    @blogs = Blog.where(genre: params[:genre]).page(params[:page]).per(10)
    @arr_category = Blog.where.not(genre: nil).pluck(:genre)
  end

  def city_open
    @blogs = Blog.where(pref_name: params[:city_name]).page(params[:page]).per(10)
    @arr_category = Blog.where.not(genre: nil).pluck(:genre)
  end

  def food_open
    @blogs = Blog.where(food_name: params[:food_name]).page(params[:page]).per(10)
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
    #@image.blank? ? params.permit(:title, :genre, :city_name,:food_name, :content).merge(draft: "1") : params.permit(:title, :genre, :city_name,:food_name, :content).merge(:media => @image['secure_url'], draft: "1")
    @image.blank? ? params.permit(:title, :genre,:pref_name, :city_name,:food_name, :content).merge(draft: "1") : params.permit(:title, :genre,:pref_name, :city_name,:food_name, :content).merge(:media => @image, draft: "1") 
  end

  def update_create_params
    params[:title] = params[:blog][:title]
    params[:genre] = params[:blog][:genre]
    params[:city_name] = params[:blog][:city_name]
    params[:content] = params[:blog][:content]
    #@image.blank? ? params.permit(:title, :genre, :city_name,:food_name, :content).merge(draft: "1") : params.permit(:title, :genre, :city_name,:food_name, :content).merge(:media => @image['secure_url'], draft: "1")
    @image.blank? ? params.permit(:title, :genre, :city_name,:food_name, :content).merge(draft: "1") : params.permit(:title, :genre, :city_name,:food_name, :content).merge(:media => @image, draft: "1")
  end

  def post_create_params
    params[:title] = params[:post][:title]
    params[:post][:image].blank? ? params.permit(:title) : params.permit(:title, :image).merge(:image => @image['secure_url'])
  end

  def post_param
    params.permit(:id).merge(draft: "0")
  end

  def comment_params
    params.permit(:content, :name).merge(blog_id: params[:url])
  end
  
end
