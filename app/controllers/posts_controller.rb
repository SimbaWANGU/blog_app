class PostsController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @posts = @author.posts
  end

  def show
    @author = Author.find(params[:author_id])
    @post = @author.posts.find(params[:id])
  end
end
