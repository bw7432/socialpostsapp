class V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def_param_group :post do
    param :post, Hash, :action_aware => true do
      param :title, String, :required => true
      param :body, String, :required => true
    end
  end

  # GET /posts
  api :GET, "/v1/posts", "List posts"
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  api :GET, '/v1/posts/:id', 'Show a post'
  param :id, :number
  def show
    render json: @post
  end

  # POST /posts
  api :POST, '/v1/posts/', 'Create Post'
  param_group :posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  api :PUT, '/v1/posts/', 'Update Post'
  param_group :posts
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  api :DELETE, '/v1/posts/:id', 'Destroy post'
  param :id, :number
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id, :posted_at)
    end
end
