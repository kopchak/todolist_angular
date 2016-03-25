class TasksController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    render json: project.tasks
  end

  def create
    render json: Task.create(task_params)
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    render json: task
  end

  def destroy
    task = Task.find(params[:id])
    render json: task.destroy
  end

  private
  def task_params
    params.permit(:title, :deadline, :status, :position, :project_id)
  end
end
