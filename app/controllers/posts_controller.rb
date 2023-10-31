class PostsController < ApplicationController
  def index
    # Find a specific user based on the `id` parameter passed
    # in the request. It assigns the found user to the `@users` instance variable, which can then be
    # used in the view to display the details of the user.
    @users = User.find(params[:author_id])
    @user = User.find(params[:author_id])

    @posts = @users.posts
  end

  def show
    # Find a specific post based on the `id` parameter passed
    # in the request. It assigns the found post to the `@posts` instance variable, which can then be
    # used in the view to display the details of the post.
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  ##
  # creates a new post associated with a user and redirects to the user's page
  # if successful, or renders the new post form with an error message if unsuccessful.
  def create
    @author = User.find(params[:author_id])
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
end
