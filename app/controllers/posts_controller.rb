class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:update, :destroy, :show]

  def index
    posts = Post.all.includes(:comments)

    render json: posts, include: ['comments']
  end

  def mine
    posts = Post.where(posted_by: current_user).includes(:comments)

    render json: posts, include: ['comments']
  end

  def create
    post = Post.new(post_params)
    post.posted_by = current_user

    if post.save
      render json: post, include: ['comments']
    else
      render json: { errors: post.errors.full_messages }, status: "400"
    end
  end

  def update
    authorize @post
    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }, status: "400"
    end
  end

  def destroy
    authorize @post
    if @post.destroy
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }, status: "400"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :media)
  end
end
