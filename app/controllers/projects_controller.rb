class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show, :index]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.order('id ASC')
    @project = Project.new
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    render text: "Show page NOT found for this #{current_user} user", status: 404 unless @project
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
    @project = current_user.projects.build(name: "Project_#{Project.last.id + 1}")
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
        format.js
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
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

    def find_project
      begin
        @project = current_user.projects.find(params[:id])
          binding.pry
      rescue Exception => e
        @project = nil
        flash[:notice] = 'Errorssssssssssssssssssss'
        binding.pry
        return
      end
    end

  def project_params
    params.require(:project).permit(:name)
  end

  def authenticate_user!
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
