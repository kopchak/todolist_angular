class ProjectsController < ApplicationController
  load_and_authorize_resource through: :current_user

  def index
    render json: @projects, root: false
  end

  def create
    @project.save
    render json: @project
  end

  def update
    @project.update(project_params)
    render json: @project
  end

  def destroy
    render json: @project.destroy
  end

  private
  def project_params
    params.permit(:title)
  end
end
