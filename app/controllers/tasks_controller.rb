class TasksController < ApplicationController

  before_action :find_project
  before_action :find_task, except: [:create]
  before_filter :authenticate_user!

  def create
    @task = @project.tasks.create(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
        format.js
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to @project
  end

  def edit

  end

  def update
    # @task.update_attribute(:name, params[:task][:name])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to root_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
        format.js
      end
    end
    # redirect_to @project
  end

  def destroy
    respond_to do |format|
      if @task.destroy
        flash[:success] = "Task is deleted"
        format.html { redirect_to root_path }
        format.json { head :no_content }
        format.js
        binding.pry
      else
        flash[:error] = "Task could NOT be deleted"
      end
    end
  end

  def complete
    respond_to do |format|
      if @task.status?
        if @task.update_attribute(:status, false)
          binding.pry
          format.html { redirect_to root_path, notice: 'Project was successfully updated.' }
          format.json { render :show, status: :ok, location: @task }
          format.js { render :uncomplete }
        end
      else
        if @task.update_attribute(:status, true)
          binding.pry
          format.html { redirect_to root_path, notice: 'Project was successfully updated.' }
          format.json { render :show, status: :ok, location: @task }
          format.js { render :complete }
        end
      end
    end

    # redirect_to @project, notice: "Task is completed"
  end

  private

  def find_project
     @project = Project.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params[:task].permit(:name)
  end

  def authenticate_user!
    unless current_user
      redirect_to new_user_session_path
    end
  end

end
