class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @projects, root: false
  end

  def create
    @project.save
    render json: @project
  end

  def update
    render json: @project.update(project_params)
  end

  def destroy
    render json: @project.destroy
  end

  private
  def project_params
    params.permit(:title)
  end
end
