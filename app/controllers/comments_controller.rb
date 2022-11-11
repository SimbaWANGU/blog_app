class CommentsController < ApplicationController
  def new_comment
    @id = current_author.id
    @post = Post.find(params[:id])
  end

  def add_comment
    @commented_post = Post.find(params[:id])
    comment = Comment.new(text: params[:text], author: current_author, post: @commented_post)
    if comment.save
      flash[:success] = 'success'
    else
      flash[:danger] = 'Error'
    end
    redirect_to "/authors/#{@commented_post.author_id}/posts/#{params[:id]}"
  end

  def delete_comment
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @author = @post.author
    if @comment.destroy
      flash[:notice] = 'Post deleted!'
      @post.comments_counter = @post.comments.count
      @post.save
    else
      flash[:alert] = 'Error! Please try again later.'
    end
    redirect_to "/authors/#{@author.id}/posts/#{@post.id}"
  end
end
