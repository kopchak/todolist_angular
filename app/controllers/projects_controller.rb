class ProjectsController < ApplicationController
  def index
    render json: Project.all, root: false
  end

  def create
    render json: Project.create(project_params)
  end

  def update
    project = Project.find(params[:id])
    render json: project.update(project_params)
  end

  def destroy
    project = Project.find(params[:id])
    render json: project.destroy
  end

  private
  def project_params
    params.permit(:title)
  end
end
