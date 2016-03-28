class AttachmentsController < ApplicationController
  def create
    comment = Comment.find(params[:comment_id])
    render json: comment.attachments.create(attachment_params)
  end

  def destroy
    attachment = Attachment.find(params[:id])
    render json: attachment.destroy
  end

  private
  def attachment_params
    params.permit(:file)
  end
end
