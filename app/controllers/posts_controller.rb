class PostsController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @posts = @author.posts.includes(:comments)
  end

  def show
    @author = Author.find(params[:author_id])
    @post = @author.posts.find(params[:id])
  end

  def new
    @id = current_user.id
    @new_post = Post.new
  end

  def create
    post = Post.new(title: params[:title], text: params[:text], author: current_user, comments_counter: 0,
                    likes_counter: 0)
    if post.save
      flash[:notice] = 'success'
    else
      flash[:error] = 'Error'
    end
    redirect_to "/authors/#{post.author_id}/posts/}", allow_other_host: true
  end
end
