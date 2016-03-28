class TasksController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource through: :project

  def create
    @task.save
    render json: @task
  end

  def update
    @task.update(task_params)
    render json: @task
  end

  def destroy
    render json: @task.destroy
  end

  private
  def task_params
    params.permit(:title, :deadline, :status, :position, :project_id)
  end
end
