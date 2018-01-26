class V1::FeedsController < ApplicationController

  def feed
    # build a feed from all users
    @feed = Event.paginate(:page => params[:page], :per_page => 25)
    render json: @feed
  end

  def user_feed

  end

end
