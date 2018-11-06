class LikesController < ApplicationController
  def index
    @feed = Feed.all
    @user = current_user.id
  end
end