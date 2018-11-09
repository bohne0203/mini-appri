class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)

  end

  private

  def blog_params
    params.require(:blog).permit(:image, :content, :title).merge(user_id: current_user.id)
  end
end
