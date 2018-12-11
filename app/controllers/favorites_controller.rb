class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(feed_id: params[:feed_id])
    redirect_to feeds_url, notice: "add #{favorite.user.name}'s like'"
  end

  def destroy
    favorite = current_user.favorites.find_by(feed_id: params[:id]).destroy
    redirect_to feeds_url, notice: "del #{favorite.user.name}'s like"
  end
end
