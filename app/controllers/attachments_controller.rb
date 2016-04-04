class AttachmentsController < ApplicationController
  load_and_authorize_resource :comment
  load_and_authorize_resource :attachment, through: :comment, shallow: true

  def create
    @attachment.save
    render json: @attachment
  end

  def destroy
    render json: @attachment.destroy
  end

  private
  def attachment_params
    params.permit(:file)
  end
end
