class V1::RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update, :destroy]

  # GET /ratings
  api :GET, "v1/ratings", "List ratings"
  def index
    @ratings = Rating.all

    render json: @ratings
  end

  # GET /ratings/1
  api :GET, "v1/ratings/:id", "Show a rating"
  def show
    render json: @rating
  end

  # POST /ratings
  api :POST, "v1/ratings", "Create a rating"
  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ratings/1
  api :PATCH, "v1/ratings/:id", "Update a Rating"
  def update
    if @rating.update(rating_params)
      render json: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ratings/1
  api :DELETE, "v1/ratings/:id", "Delete a rating"
  def destroy
    @rating.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rating_params
      params.require(:rating).permit(:user_id, :rater_id, :rating, :rated_at)
    end
end
