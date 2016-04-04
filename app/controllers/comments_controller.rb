class CommentsController < ApplicationController
  load_and_authorize_resource :task
  load_and_authorize_resource :comment, through: :task, shallow: true

  def create
    @comment.save
    render json: @comment
  end

  def destroy
    render json: @comment.destroy
  end

  private
  def comment_params
    params.permit(:text, :file)
  end
end
