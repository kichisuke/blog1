class BlogController < ApplicationController
  def index
    @posts = Post.find(4)
  end

  def blog_post
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def create
    #@posts = Post.create! params.require(:post.permit(:title, :content))
    @posts = params.permit(:name, :content)
    Post.create(@posts)
    redirect_to :blog_post
  end

end
