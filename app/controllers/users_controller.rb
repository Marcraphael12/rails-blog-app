class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @current_user = current_user
  end
end
