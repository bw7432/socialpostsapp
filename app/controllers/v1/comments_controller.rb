class V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  api :GET, 'v1/comments', 'Show events for a specific user, 25 per page'
  def index
    @comments = Comment.all

    render json: @comments
  end

  api :GET, 'v1/comments/:id', 'Show a specific comment'
  param :id, :number
  def show
    render json: @comment
  end

  api :POST, 'v1/comments', 'create a comment'
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  api :PATCH, 'v1/comments/:id', 'Update a comment'
  param :id, :number
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, 'v1/comments', 'Delete a comment'
  param :id, :number
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:message, :post_id, :user_id)
    end
end
