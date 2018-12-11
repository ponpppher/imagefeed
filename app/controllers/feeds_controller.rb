class FeedsController < ApplicationController
before_action :set_feed, only:[:edit, :update, :destroy]
  def index
    @feed = Feed.all.reverse_order
    @favorite = current_user.favorites
  end

  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    render :new if @feed.invalid?
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    if @feed.save
      redirect_to feeds_path, notice: 'new feed posted'
    else
      render :new
    end 
  end

  def edit
  end

  def update
    if @feed.update(feed_params)
      redirect_to feeds_path, notice:"feed edited"
    else
      render :edit
    end
  end

  def destroy
    @feed.destroy
    redirect_to feeds_path, notice:"feed deleted"
  end

  private
  def feed_params
    params.require(:feed).permit(:content, :image, :image_cache)
  end

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
