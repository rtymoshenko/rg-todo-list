class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]
  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @projects = Project.all

  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show

  end

  # GET /todo_lists/new
  def new
    @project = Project.new
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
#    @project = Project.new(project_params)
#    @project.save
#    redirect_to projects_path

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end

  end

  # GET /todo_lists/1/edit
  def edit

  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
=begin
    @project.update(project_params)
    redirect_to projects_path
=end
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_project
      @project = Project.find(params[:id])
    end

  def project_params
    params.require(:project).permit(:name)
  end
end
