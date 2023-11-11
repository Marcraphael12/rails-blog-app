class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  load_and_authorize_resource

  def index
    @users = User.find(params[:user_id])
    @user = User.find(params[:user_id])

    @posts = @users.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @author = User.find(params[:user_id])
    @post = @author.posts.new(post_params)

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new, alert: 'An error has occurred while creating the post'
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path, notice: 'Post was successfully deleted.'
  end
end
