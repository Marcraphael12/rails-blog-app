class UsersController < ApplicationController
  def index
    # retrieving all the records from the `User` model and assigning them to the
    # `@users` instance variable. This allows the retrieved users to be accessed and used in the view.
    @users = User.all
  end

  def show
    # Find a specific user based on the `id` parameter passed
    # in the request. It assigns the found user to the `@users` instance variable, which can then be
    # used in the view to display the details of the user.
    @users = User.find(params[:id])
  end
end
