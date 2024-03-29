class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post)
    if @like.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, notice: 'Error Occured While Liking The Post'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(author: current_user)

    if @like
      @like.destroy
      redirect_to user_post_path(@post.user, @post), notice: 'Unliked!'
    else
      redirect_to user_post_path(@post.user, @post), alert: 'Unlike failed.'
    end
  end
end
