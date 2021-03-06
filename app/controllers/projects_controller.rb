class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.order('id ASC')
    @project = Project.new
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    # @project = Project.new
    @project = current_user.projects.build
  end

  # POST /projects
  # POST /projects.json
  def create
#    @project.save
#    redirect_to projects_path
#    @project = Project.new(project_params)

    @project = current_user.projects.build(name: "New Project#")
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
        format.js { flash.now[:notice] = "Project is created" }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /projects/1/edit
  def edit

  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
=begin
    @project.update(project_params)
    redirect_to projects_path
=end
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
        format.js { flash.now[:notice] = "Project is updated" }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    respond_to do |format|
      if @project.destroy
        format.html { redirect_to root_path, notice: 'Project was successfully destroyed.' }
        format.json { head :no_content }
        format.js { flash.now[:notice] = "Project is deleted" }
      end
    end
  end

  private

  def find_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

end
