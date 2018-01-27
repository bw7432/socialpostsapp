class V1::EventsController < ApplicationController
  before_action :set_event, only: [:show]

  api :GET, '/events', 'Show paginated events, 25 per page'
  def index
    @events = Event.order(posted_at: 'desc').paginate(:page => params[:page], :per_page => 25)
    render json: @events
  end

  api :GET, '/user_events/:id', 'Show events for a specific user'
  param :id, :number
  def user_events
    @events = Event.where(user_id: params[:id]).order(posted_at: 'desc').paginate(:page => params[:page], :per_page => 25)
    render json: @events
  end

  def show
    render json: @event, include: ['eventable', 'user']
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

end
