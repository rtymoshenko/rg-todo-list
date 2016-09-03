class TasksController < ApplicationController

before_action :find_project

  def create
    binding.pry
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:succss] = "Task is deleted"
    else
      flash[:error] = "Task could NOT be deleted."
    end
    redirect_to @project
  end

  private

  def find_project
     @project = Project.find(params[:project_id])
  end

  def task_params
    params[:task].permit(:name, :status, :order)
  end

end
