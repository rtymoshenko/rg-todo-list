class TasksController < ApplicationController

  before_action :find_project
  before_action :find_task, except: [:create]

  def create
    # binding.pry
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task is deleted"
    else
      flash[:error] = "Task could NOT be deleted."
    end
    redirect_to @project
  end

  def complete
    @task.update_attribute(:status, true)
    redirect_to @project, notice: "Task is completed"
  end

  private

  def find_project
     @project = Project.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params[:task].permit(:name, :status, :order)
  end

end
