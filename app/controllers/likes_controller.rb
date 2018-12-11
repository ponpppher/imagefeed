class LikesController < ApplicationController
  def index
    @like = current_user.favorite_feed
  end

  def destroy
    favorite = current_user.favorites.find_by(feed_id: params[:id]).destroy
    redirect_to likes_url, notice: "del #{favorite.user.name}'s like"
  end
end