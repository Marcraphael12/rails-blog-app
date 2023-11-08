class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = User.all
    @post = @user.posts.includes(:comments, :likes)
  end

  def show
    @user = User.find(params[:user_id])
    @users = User.all
    @post = Post.includes(:author).find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])

    # @post = current_user.posts.build(post_params) # Assuming you have a relationship between users and posts
    @post = @user.posts.build(post_params) # Assuming you have a relationship between users and posts

    if @post.save
      # Handle successful creation, e.g., redirect to a show page
      # redirect_to user_path(@user)
      redirect_to user_posts_path
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def increment_likes
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])

    @post.includes(:author).increment!(:likes_counter)

    redirect_to user_post_path
  end
end
