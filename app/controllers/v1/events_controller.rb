class V1::EventsController < ApplicationController
  before_action :set_event, only: [:show]

  api :GET, 'v1/events', 'Show paginated events, 25 per page'
  def index
    @events = Event.order(posted_at: 'desc').paginate(:page => params[:page], :per_page => 25)
    render json: @events
  end

  api :GET, 'v1/user_events/:id', 'Show events for a specific user, 25 per page'
  param :id, :number
  def user_events
    @events = Event.where(user_id: params[:id]).order(posted_at: 'desc').paginate(:page => params[:page], :per_page => 25)
    render json: @events
  end

  api :GET, 'v1/events/:id', "Show event - includes its associated record. Use 'type_of' to select template."
  param :id, :number
  def show
    render json: @event, include: ['eventable', 'user']
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

end
