class PostsController < ApplicationController
  def index
    # Find a specific user based on the `id` parameter passed
    # in the request. It assigns the found user to the `@users` instance variable, which can then be
    # used in the view to display the details of the user.
    @users = User.find(params[:user_id])

    @posts = @users.posts
  end

  def show
    # Find a specific post based on the `id` parameter passed
    # in the request. It assigns the found post to the `@posts` instance variable, which can then be
    # used in the view to display the details of the post.
  end
end
