class CommentsController < ApplicationController
  def create
    render json: Comment.create(task_params)
  end

  def destroy
    comment = Comment.find(params[:id])
    render json: comment.destroy
  end

  private
  def task_params
    params.permit(:text, :file, :task_id)
  end
end