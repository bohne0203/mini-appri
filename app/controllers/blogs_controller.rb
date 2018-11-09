class BlogsController < ApplicationController

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    redirect_to controller: :blogs, action: :index
  end

  def destroy
    @blog = Blog.find(params[:id])
      if @blog.user_id == current_user.id
        @blog.destroy
      end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
      if @blog.user_id == current_user.id
        @blog.update(blog_params)
      end
    end

  private

  def blog_params
    params.require(:blog).permit(:image, :content, :title).merge(user_id: current_user.id)
  end
end
