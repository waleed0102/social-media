class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: [:update, :destroy]

  def create
    comment = @post.comments.new(comments_params)
    comment.commented_by = current_user

    if comment.save
      render json: comment, include: ['post']
    else
      render json: { errors: comment.errors.full_messages }, status: "400"
    end
  end

  def update
    authorize @comment
    if @comment.update(comments_params)
      render json: @comment, include: ['post']
    else
      render json: { errors: @comment.errors.full_messages }, status: "400"
    end
  end

  def destroy
    authorize @comment
    if @comment.destroy
      render json: @comment, include: ['post']
    else
      render json: { errors: @comment.errors.full_messages }, status: "400"
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:content, :media)
  end
end
