class CommentsController < ApplicationController
  def new_comment
    @id = current_user.id
    @post = Post.find(params[:id])
  end

  def add_comment
    @commented_post = Post.find(params[:id])
    comment = Comment.new(text: params[:text], author: current_user, post: @commented_post)
    if comment.save
      flash[:success] = 'success'
    else
      flash[:danger] = 'Error'
    end
    redirect_to "/authors/#{@commented_post.author_id}/posts/#{params[:id]}"
  end
end
