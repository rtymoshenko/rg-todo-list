class TasksController < ApplicationController

  before_action :find_project, except: :sort
  before_action :find_task, except: [:create, :sort]
  before_filter :authenticate_user!

  def create
    @task = @project.tasks.create(task_params)
    respond_to do |format|
      if @task.save
        format.html {redirect_to root_path, notice: 'Task was successfully created.'}
        format.json {render :show, status: :ok, location: @task}
        format.js
      else
        format.html {render :new}
        format.json {render json: @task.errors, status: :unprocessable_entity}
        format.js { redirect_to root_path, notice: 'Task was NOT successfully created.'}
      end
    end
    # redirect_to @project
  end

  def edit

  end

  def sort
    params[:order].each do |key,value|
      Task.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html {redirect_to root_path, notice: 'Task was successfully updated.'}
        format.json {render :show, status: :ok, location: @task}
        format.js
      else
        flash[:error] = "Task could NOT be updated"
      end
    end
  end


  def destroy
    respond_to do |format|
      if @task.destroy
        flash[:success] = "Task is deleted"
        format.html {redirect_to root_path}
        format.json {head :no_content}
        format.js
      else
        flash[:error] = "Task could NOT be deleted"
      end
    end
  end

  def complete
    respond_to do |format|
      if @task.status?
        if @task.update_attribute(:status, false)
          format.html {redirect_to root_path, notice: 'Task was successfully updated.'}
          format.json {render :show, status: :ok, location: @task}
          format.js {render :uncomplete}
        end
      else
        if @task.update_attribute(:status, true)
          format.html {redirect_to root_path, notice: 'Task was successfully updated.'}
          format.json {render :show, status: :ok, location: @task}
          format.js {render :complete}
        end
      end
    end

    # redirect_to @project, notice: "Task is completed"
  end

  private

  def find_project
    begin
      @project = current_user.projects.find(params[:project_id])
    rescue
      raise 'Invalid project'
      return
    end
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params[:task].permit(:name, :deadline)
  end

end
