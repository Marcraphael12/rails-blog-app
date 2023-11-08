class LikesController < ApplicationController
  def increment_likes
    @like = Like.find(params[:id])
    @like.increment_likes_counter
    redirect_to @like.post, notice: 'Like incrementado'
  end
end
