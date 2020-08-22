class LikesController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @alreadylike = Like.find_by(ip: request.remote_ip, blog_id: params[:blog_id])
    if @alreadylike
      redirect_back(fallback_location: root_path)
      flash[:notice] = "You alredy liked it, thank you!"
    else
      @like = Like.create(blog_id: params[:blog_id], ip: request.remote_ip)
      redirect_back(fallback_location: root_path)
    end
  end
end
