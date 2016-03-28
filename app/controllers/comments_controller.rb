class CommentsController < ApplicationController
  load_and_authorize_resource :task
  load_and_authorize_resource through: :task

  def create
    @comment.save
    render json: @comment
  end

  def destroy
    render json: @comment.destroy
  end

  private
  def comment_params
    params.permit(:text, :file, :task_id)
  end
end
