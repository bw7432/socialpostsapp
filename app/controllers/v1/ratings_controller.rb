class V1::RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update, :destroy]

  # POST /ratings
  api :POST, "v1/ratings", "Create a rating, a user can only rate another user once."
  def create
    if !Rating.exists?(user_id: rating_params[:user_id], rater_id: rating_params[:rater_id])
      @rating = Rating.new(rating_params)

      if @rating.save
        render json: @rating, status: :created
      else
        render json: @rating.errors, status: :unprocessable_entity
      end
    else
      @rating = false
      render json: @rating, status: 200
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
      params.require(:rating).permit(:user_id, :rater_id, :rating)
    end
end
