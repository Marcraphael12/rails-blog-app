class CommentsController < ApplicationController
  # a before action filter in
  # Ruby on Rails. It is used to ensure that the user is authenticated before allowing access to certain
  # actions.
  before_action :authenticate_user!, only: %i[create destroy]

  # use a before action to load the resource into an instance variable and authorize it for every action
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, alert: 'An error has occurred while creating the comment'
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @post.decrement!(:comments_counter)
    @comment.destroy!
    redirect_to user_post_path(id: @post.id), notice: 'The comment has been successfully removed!'
  end
end
