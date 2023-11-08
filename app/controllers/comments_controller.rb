class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    @comment.author = @user
    @comment.post = @post

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      puts @comment.errors.full_messages
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
